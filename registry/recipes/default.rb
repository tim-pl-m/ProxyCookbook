#
# Cookbook Name:: registry
# Recipe:: default
#
# Copyright (C) 2015 adesso AG
#
# All rights reserved - Do Not Redistribute
#

docker_service 'default' do
  action [:create, :start]
end

include_recipe 'docker_compose::installation'

# Provision Compose file
cookbook_file '/etc/docker-compose_nginx.yml' do
  source 'docker-compose_nginx.yml'
  owner 'root'
  group 'root'
  mode 0640
  notifies :up, 'docker_compose_application[nginx]', :delayed
end

# Provision Compose application
docker_compose_application 'nginx' do
  action :up
  compose_files [ '/etc/docker-compose_nginx.yml' ]
end


