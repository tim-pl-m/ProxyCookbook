#
# Cookbook Name:: registry
# Recipe:: default
#
# Copyright (C) 2015 adesso AG
#
# All rights reserved - Do Not Redistribute
#

# This declaration is only necessary if a non-master recipe is run stand-alone
# service "jenkins" do
#   action :nothing
# end

docker_service 'default' do
  action [:create, :start]
end
