#
# Copyright 2014, Yves Vogl, adesso AG
#
# All rights reserved - Do Not Redistribute
#

require 'json'
require 'serverspec'
require 'types/jenkins_plugin.rb'
require 'types/dsl.rb'
require 'rbconfig'

case RbConfig::CONFIG['host_os']
when /mswin|msys|mingw|cygwin|bccwin|wince|emc/
  set :backend, :cmd
  set :os, family: 'windows'
else
  set :backend, :exec
end

RSpec.configure do |config|
  config.color = true
  config.formatter = :documentation
end
