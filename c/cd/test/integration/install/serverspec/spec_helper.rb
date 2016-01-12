#
# Copyright 2014, adesso AG
#
# All rights reserved - Do Not Redistribute
#

require 'json'
require 'serverspec'

KITCHEN_PATH = "/tmp/kitchen"

# Required by serverspec
set :backend, :exec

RSpec.configure do |config|
  # Configure Rspec to only accept the new 'expect' syntax
  config.expect_with(:rspec) { |c| c.syntax = :expect }
end

def node_json(node_name)
  JSON.parse(File.read("#{KITCHEN_PATH}/nodes/#{node_name}.json"))
end
