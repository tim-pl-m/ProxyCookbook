require 'chefspec'
require 'chefspec/berkshelf'

RSpec.configure do |config|
  config.add_formatter :documentation
  config.color = true

  # Configure Rspec to only accept the new 'expect' syntax
  config.expect_with(:rspec) { |c| c.syntax = :expect }
end

at_exit { ChefSpec::Coverage.report! }
