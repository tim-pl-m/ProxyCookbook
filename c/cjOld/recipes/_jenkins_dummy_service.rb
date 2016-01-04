#
# Cookbook Name:: ciexjenkins
# Recipe:: activedirectory
#
# Copyright (C) 2015 adesso AG
#
# All rights reserved - Do Not Redistribute
#

# This declaration is only necessary if a non-master recipe is run stand-alone
service "jenkins" do
  action :nothing
end
