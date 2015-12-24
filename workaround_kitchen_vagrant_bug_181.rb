# Remove as soon https://github.com/test-kitchen/kitchen-vagrant/issues/181 is fixed.
# Remove also 'driver/vagrantfiles' in '.kitchen.yml'

# Vagrant.configure(2) { |configure| configure.vm.box_check_update = false }

# Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
#
#   config.ssh.username = "vagrant"
#   config.ssh.password = "vagrant"
#
#    config.vm.provider "virtualbox" do |vb|
#      vb.gui = true
#    end
# end

Vagrant.configure(2) do |config|

  config.vm.box_check_update = false
  # config.ssh.username = "vagrant"
  # config.ssh.password = "vagrant"

  #  config.vm.provider "virtualbox" do |vb|
  #    vb.gui = true
  #  end
end
