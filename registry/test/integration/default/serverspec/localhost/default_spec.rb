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
   describe command 'docker ps' do
     its(:stdout) { is_expected.to match(/CONTAINER ID*/) }
    #  CONTAINER ID        IMAGE
   end
 end

 describe 'docker-compose installed' do
   describe command '/usr/local/bin/docker-compose -v' do
     its(:stdout) { is_expected.to match(/docker-compose version*/) }
    #  docker-compose version 1.8.0, build f3628c7
   end
 end

 describe 'docker-registry configured' do
   #  Ensure the correct image was pulled
     describe command('docker ps -f name=registry_registry_1 | awk \'BEGIN{FS="  +"} NR > 1 { print $2 }\'') do
       its(:exit_status) { should eq 0 }
       its(:stdout) { should eq "registry:2\n" }
     end

     # Ensure the first specified nginx container is up
     describe command('docker ps -q -f name=registry_registry_1 | wc -l') do
       its(:exit_status) { should eq 0 }
       its(:stdout) { should eq "1\n" }
     end

     describe command('docker ps -q -f name=registry_registry_1 | wc -l') do
       its(:exit_status) { should eq 0 }
       its(:stdout) { should eq "1\n" }
     end
 end

  describe 'test registry locally' do
    # TODO remove image after tests
    # docker pull ubuntu && docker tag ubuntu localhost:5000/ubuntu
    describe command('docker pull ubuntu && docker tag ubuntu localhost:5000/ubuntu') do
      its(:exit_status) { should eq 0 }
      its(:stdout) { is_expected.to match(/ubuntu:latest/) }
    end
    # docker push localhost:5000/ubuntu
    describe command('docker push localhost:5000/ubuntu') do
      its(:exit_status) { should eq 0 }
      its(:stdout) { is_expected.to match(/size: 1150/) }
    end
    # docker pull localhost:5000/ubuntu
    describe command('docker pull localhost:5000/ubuntu') do
      its(:exit_status) { should eq 0 }
      its(:stdout) { is_expected.to match(/Image is up to date/) }
    end

  end

 # registry:2

















