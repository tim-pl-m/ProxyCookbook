#
# Cookbook Name:: ciexjenkins
# Recipe:: plugins
#
# Copyright (C) 2015 adesso AG
#
# All rights reserved - Do Not Redistribute
#

node['ciexjenkins']['plugins'].each do |plugin, params|
  jenkins_plugin plugin do
    version params['version']
    source params['source'] if params.key?('source')
    notifies :restart, 'service[jenkins]'
  end
end

unless node.run_list.include?("ciexjenkins::master")
  include_recipe "ciexjenkins::_jenkins_dummy_service"
end
