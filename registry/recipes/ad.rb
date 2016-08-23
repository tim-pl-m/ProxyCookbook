#
# Cookbook Name:: ciex-jenkins
# Recipe:: master
#
# Copyright (C) 2015 adesso AG
#
# All rights reserved - Do Not Redistribute
#

require 'net/ssh'
require 'openssl'

if (!node['ciexjenkins']['install_plugins'] || !node['ciexjenkins']['plugins'].key?('active-directory'))
  jenkins_plugin 'active-directory' do
    notifies :restart, 'service[jenkins]', :immediately
  end
end

credentials = Chef::EncryptedDataBagItem.load("dev", "credentials")

enc_key = credentials["jenkins_cli"]["private_key"]
plain = Base64.decode64(enc_key)
key = OpenSSL::PKey::RSA.new(plain)
private_key = key.to_pem
public_key = "#{key.ssh_type} #{[key.to_blob].pack('m0')}"

# If security was enabled in a previous chef run then set the private key in the run_state
# now as required by the Jenkins cookbook
ruby_block 'set jenkins private key' do
  block do
    node.run_state[:jenkins_private_key] = private_key
  end
  only_if { node.attribute?('security_enabled') }
end

# Create the Jenkins user with the public key
jenkins_user credentials["jenkins_cli"]["username"] do
  public_keys [public_key]
  not_if { node.attribute?('security_enabled') }
  notifies :execute, 'jenkins_script[add_authentication]', :immediately
end

jenkins_script 'add_authentication' do
  command <<-EOH.gsub(/^ {4}/, '')
    import jenkins.model.*
    import hudson.security.*
    import org.jenkinsci.plugins.*
    import hudson.plugins.active_directory.ActiveDirectorySecurityRealm

    String domain = '#{node["ciexjenkins"]["ad"]["domain"]}'
    String site = '#{node["ciexjenkins"]["ad"]["site"]}'
    String server = '#{node["ciexjenkins"]["ad"]["server"]}'
    String bindName = '#{credentials["ad"]["username"]}'
    String bindPassword = '#{credentials["ad"]["password"]}'

    def instance = Jenkins.getInstance()

    SecurityRealm ad_realm = new ActiveDirectorySecurityRealm(domain, site, bindName, bindPassword, server)
    instance.setSecurityRealm(ad_realm)

    def strategy = new FullControlOnceLoggedInAuthorizationStrategy()
    instance.setAuthorizationStrategy(strategy)

    instance.save()
  EOH
  notifies :run, 'ruby_block[set the security_enabled flag]', :immediately
  action :nothing
end

# Set the security enabled flag and set the run_state to use the configured private key
ruby_block 'set the security_enabled flag' do
  block do
    node.run_state[:jenkins_private_key] = private_key
    node.set['security_enabled'] = true
    node.save
  end
  action :nothing
end

unless node.run_list.include?("ciexjenkins::master")
  include_recipe "ciexjenkins::_jenkins_dummy_service"
end
