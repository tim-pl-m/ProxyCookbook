# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

def modules_install (modules)

  script  = "export PATH=$PATH:/opt/puppetlabs/puppet/bin"

  modules = [modules] unless modules.kind_of?(Array)

  modules.each do |mod_name|
    module_path_name = mod_name.sub(/\//, '-')
    script += "; puppet module install #{mod_name}"
    script += " --modulepath /etc/puppetlabs/code/modules"
  end

  return script
end

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Virtualbox Image to be used an all machines
  config.vm.box = "Centos6.7"
  config.vm.box_url = "https://github.com/CommanderK5/packer-centos-template/releases/download/0.6.7/vagrant-centos-6.7.box"

  # Node definitions
  ##############################################################

  # jenkins ci
  config.vm.define :ci do |ci|
    ci.vm.network "private_network", ip: "10.10.10.11"
    ci.vm.network "forwarded_port", guest: 8080, host: 9081

    ci.vm.provision "shell" do |shell|
      shell.inline = modules_install "rtyler/jenkins"
    end

    # TODO fix path
    ci.vm.provision "puppet" do |puppet|
      puppet.environment_path = "../../../puppet/environments"
      puppet.environment = "ci"
    end
  end

  # gitlab server
  # config.vm.define :git do |git|
  #   git.vm.network "private_network", ip: "10.10.10.12"
  #   git.vm.network "forwarded_port", guest: 80, host: 9082
  #
  #   git.vm.provision "shell" do |shell|
  #     shell.inline = modules_install "vshn/gitlab"
  #   end
  #
  #   git.vm.provision "puppet" do |puppet|
  #     puppet.environment_path = "../../../puppet/environments"
  #     puppet.environment = "git"
  #   end
  # end

  # image build server - build the docker images
  # config.vm.define :ibs do |ibs|
  #   ibs.vm.network "private_network", ip: "10.10.10.13"
  #
  #   ibs.vm.provision "shell" do |shell|
  #     shell.inline = modules_install [
  #       # "garethr/docker"
  #       "garethr/docker",
  #       # "counsyl/packer"
  #       "counsyl/packer",
  #       "garystafford/docker_compose"
  #     ]
  #   end

    # ibs.vm.provision "puppet" do |puppet|
    #   puppet.environment_path = "puppet/environments"
    #   puppet.environment = "ibs"
    # end
  # end
#docker-compose error:
# ==> ibs: Error: docker-compose up -d returned 1 instead of one of [0]
# ==> ibs: Error: /Stage[main]/Ibs/Exec[run registry]/returns: change from notrun to 0 failed: docker-compose up -d returned 1 instead of one of [0]

  #
  # # deployment server one
  # config.vm.define :s1, autostart: false do |s1|
  #   s1.vm.network "private_network", ip: "10.10.10.14"
  # end
  #
  # # deployment server two
  # config.vm.define :s2, autostart: false do |s2|
  #   s2.vm.network "private_network", ip: "10.10.10.15"
  # end
end
