#
# Cookbook Name:: ciex-jenkins
# Recipe:: master
#
# Copyright (C) 2015 adesso AG
#
# All rights reserved - Do Not Redistribute
#

include_recipe "java::default"
include_recipe "java::set_java_home"
include_recipe "jenkins::master"
if node["ciexjenkins"]["install_plugins"]
  include_recipe "ciexjenkins::plugins"
end

cron 'cleanup' do
  minute '0'
  command 'find /tmp/ -maxdepth 1 -user jenkins'\
          ' -mmin +720 \( ! -name "hsperfdata_*" \)'\
          ' -exec rm -rf {} \; >/dev/null 2>&1'
end

if node["ciexjenkins"]["ad"]["enabled"]
  include_recipe "ciexjenkins::ad"
end
