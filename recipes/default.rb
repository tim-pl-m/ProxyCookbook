#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright (C) 2014
#
#
#

# package "httpd" do
# 	action :install
# end

package "httpd"

service "httpd" do
  action [ :enable, :start ]
end

# service 'apache2' do
#   action :enable
# end

template "/var/www/html/index.html" do
  source 'index.html.erb'
  mode '0644'
end
