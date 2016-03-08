#
# Cookbook Name:: ciexjenkinsdocker
# Recipe:: install
#
# Copyright (C) 2015 Max Edenharter
#
# All rights reserved - Do Not Redistribute
#

#TODO for centos
# package 'docker-selinux'

# docker_installation 'default' do
#   repo 'test'
#   action :create
# end

# docker_service 'default' do
#   version node['ciexdocker']['version']
#   # action [:create, :start]
#   action [:create]
#   action [:start]
# end

#TODO ubuntu?
package 'docker'

docker_service 'default' do
  version node['ciexdocker']['version']
  host [
    "tcp://#{node['ciexdocker']['listen_address']}:#{node['ciexdocker']['listen_port']}",
    'unix:///var/run/docker.sock'
  ]
  tls false
  # provider Chef::Provider::DockerService::Systemd
  action [:create, :start]
end
#
# credentials = Chef::EncryptedDataBagItem.load("dev", "credentials")
#
# template '/tmp/adesso_centos_slave' do
#   source 'adesso_centos_slave.erb'
#   variables(:ssh_user => credentials["slave_container"]["ssh"]["username"],
#   :ssh_pw => credentials["slave_container"]["ssh"]["password"])
#   notifies :build, 'docker_image[adesso-centos-slave]', :immediately
# end
#
# docker_image 'adesso-centos-slave' do
#   source '/tmp/adesso_centos_slave'
#   force true
#   read_timeout 120
#   write_timeout 120
#   action :build_if_missing
# end
#
# include_recipe 'firewall::default'
#
# firewall_rule 'docker' do
#   port node['ciexdocker']['listen_port']
#   source node['ciexdocker']['allowed_api_client_ip']
#   protocol :tcp
#   command :allow
# end
#
# firewall_rule 'icmp' do
#   protocol :icmp
#   command :allow
# end
