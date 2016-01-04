require 'serverspec'

# Required by serverspec
set :backend, :exec

RSpec.configure do |config|
  # Configure Rspec to only accept the new 'expect' syntax
  config.expect_with(:rspec) { |c| c.syntax = :expect }
end
