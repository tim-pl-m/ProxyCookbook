#
# Copyright 2014, adesso AG
#
# All rights reserved - Do Not Redistribute
#

require_relative 'spec_helper.rb'

describe 'ciexdocker::install' do
  let(:node) { node_json("install-centos7")["default"] }

  describe 'docker service' do
    it { expect(service('docker')).to be_running }
  end

#TODO fix
  # describe 'docker daemon port' do
  #   it 'is listening' do
  #     expect(port(node['ciexdocker']['listen_port'])).to(
  #       be_listening.on(node['ciexdocker']['listen_address']).with('tcp6'))
  #   end
  # end
  #
  # describe command('firewall-cmd --direct --get-all-rules') do
  #   protocol = 'ipv'
  #   filter_command = ' filter INPUT 50 -p tcp -m tcp -m multiport'
  #   comments = ' -m comment --comment docker -j ACCEPT'
  #
  #   its(:stdout) do
  #     port = / --dports #{node['ciexdocker']['listen_port']}/
  #     ip_version = '4'
  #     regex_filter = /#{filter_command}#{port}#{comments}/
  #     should match(/#{protocol}#{ip_version}#{regex_filter}/)
  #   end
  #   its(:stdout) do
  #     port = / --dports #{node['ciexdocker']['listen_port']}/
  #     ip_version = '6'
  #     regex_filter = /#{filter_command}#{port}#{comments}/
  #     should match(/#{protocol}#{ip_version}#{regex_filter}/)
  #   end
  # end
  #
  # describe 'docker slave image' do
  #   it 'must exist' do
  #     expect(docker_image('adesso-centos-slave:latest')).to exist
  #   end
  # end
  #
  # describe command('docker create --name="slave-container" adesso-centos-slave:latest') do
  #   it 'runs successfully' do
  #     expect(subject.exit_status).to eq(0)
  #   end
  #   it 'creates the docker container' do
  #     expect(docker_container('slave-container')).to exist
  #   end
  # end
  #
  # describe command('docker start slave-container') do
  #   it 'runs successfully' do
  #     expect(subject.exit_status).to eq(0)
  #   end
  #   it 'starts the docker container' do
  #     expect(docker_container('slave-container')).to be_running
  #   end
  # end
  #
  # after(:context) do
  #   `docker stop slave-container`
  #   `docker rm slave-container`
  # end
end
