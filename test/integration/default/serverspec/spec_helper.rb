require 'serverspec'

RSpec.configure do |config|
  config.tty = true
end

set :backend, :exec
