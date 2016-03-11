#
# Copyright 2014, Max Edenharter, adesso AG
#
# All rights reserved - Do Not Redistribute
#
require_relative 'spec_helper.rb'

describe 'Jenkins Master' do
  packages = ['vim-enhanced', 'net-tools', 'nano', 'htop', 'git', 'jenkins',
              'httpd', 'iftop', 'sshpass', 'smem']

  packages.each do |p|
    describe package(p) do
      it { should be_installed }
    end
  end

  describe command('java -version') do
    its(:stderr) { should contain('java version \"1.7') }
    its(:stderr) { should contain('Java\(TM\) SE Runtime Environment') }
  end

  describe service('jenkins') do
    it { should be_running }
  end

  describe command('sudo crontab -l') do
    its(:stdout) { is_expected.to match(/0 \* \* \* \*/) }
  end

  # reactivate when plugins are specified in role
  #
  # node = JSON.parse(IO.read(File.join('/tmp', 'kitchen', 'dna.json')))
  # puts JSON.pretty_generate(node)
  #
  # node = JSON.parse(IO.read(File.join('/tmp', 'kitchen', 'dna.json')))['default']
  #
  # node['jenkins_plugin'].each do |plugin|
  #   describe jenkins_plugin(plugin['name']) do
  #     it { should be_a_jenkins_plugin }
  #     if plugin['version'] != 'latest'
  #       it { should have_version(plugin['version']) }
  #     end
  #   end
  # end

  describe service('httpd') do
    it { should be_running }

    # reactivate for https
    #
    # it 'apache is listening on port 443' do
    #   expect(port(443)).not_to be_listening
    # end

    it 'apache is listening on port 80' do
      expect(port(80)).to be_listening
    end

    it 'apache(jenkins) is listening on port 8080' do
      expect(port(8080)).to be_listening
    end
  end
end
