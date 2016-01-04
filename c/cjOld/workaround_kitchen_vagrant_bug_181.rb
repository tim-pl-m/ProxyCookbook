# Remove as soon https://github.com/test-kitchen/kitchen-vagrant/issues/181 is fixed.
# Remove also 'driver/vagrantfiles' in '.kitchen.yml'
Vagrant.configure(2) { |configure| configure.vm.box_check_update = false }
