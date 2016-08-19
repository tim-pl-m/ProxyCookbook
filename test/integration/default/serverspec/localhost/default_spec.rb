require 'spec_helper'

 if os[:family] == 'ubuntu'
       describe '/etc/lsb-release' do
         it "exists" do
             expect(file('/etc/lsb-release')).to be_file
         end
       end
 end

 if os[:family] == 'redhat'
   describe '/etc/redhat-release' do
     it "exists" do
         expect(file('/etc/redhat-release')).to be_file
     end
   end
 end

 describe 'docker installed' do
  #  describe command 'sudo service httpd status' do
  #    its(:stdout) { is_expected.to match(/httpd \(pid\s\s.*is\srunning/) }
  #    # httpd (pid  3047) is running...
  #  end
   describe command 'docker -v' do
    #  its(:stderr) { is_expected.to match(/git version 1\.7\..*/) }
     its(:stdout) { is_expected.to match(/Docker version*/) }
    #  Docker version 1.7.1, build 786b29d/1.7.1
   end
 end