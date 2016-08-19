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
   describe command 'docker -v' do
     its(:stdout) { is_expected.to match(/Docker version*/) }
    #  Docker version 1.7.1, build 786b29d/1.7.1
   end
 end


 describe 'packer installed' do
   describe command 'packer -v' do
     its(:stdout) { is_expected.to match(/0.8.5/) }
    # 0.8.5
   end
 end

# docker-compose -v
#  docker-compose version: 1.4.0

















