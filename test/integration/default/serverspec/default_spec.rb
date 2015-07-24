require 'spec_helper'

# describe 'apache installed' do
  # Serverspec examples can be found at
  # http://serverspec.org/resource_types.html
  # it 'does something' do
  #   skip 'Replace this with meaningful tests'
  # end
# end
#
describe 'apache running' do
  describe command 'sudo service httpd status' do
    its(:stdout) { is_expected.to match(/httpd \(pid\s\s.*is\srunning/) }
    # httpd (pid  3047) is running...
  end
#   describe command '/etc/init.d/httpd status' do
#     # service apache2 status
#     its(:stderr) { is_expected.to match(/git version 1\.7\..*/) }
#     # httpd is running
#   end
end

describe 'apache default website' do
  it 'responds on port 80' do
    expect(port 80).to be_listening 'tcp'
  end
end
