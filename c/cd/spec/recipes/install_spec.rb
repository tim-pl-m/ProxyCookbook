# Copyright 2014, adesso AG
#
# All rights reserved - Do Not Redistribute
#

require_relative '../spec_helper.rb'

describe 'ciexdocker::install' do
  cached(:chef_run) { ChefSpec::ServerRunner.new.converge(described_recipe) }

  it 'installs docker-selinux package' do
    expect(chef_run).to install_package('docker-selinux')
  end

  it 'creates docker_service[default]' do
    expect(chef_run).to create_docker_service('default')
  end

  it 'creates dockerfile for slave image' do
    expect(chef_run).to create_cookbook_file('/tmp/adesso_centos_slave')
  end

  it 'builds the slave docker image from dockerfile' do
    expect(chef_run).to build_if_missing_docker_image('adesso-centos-slave')
  end

  it 'includes the firewall recipe' do
    expect(chef_run).to include_recipe('firewall::default')
  end

  it 'creates a firewall rule for docker port' do
    expect(chef_run).to create_firewall_rule('docker')
  end
end
