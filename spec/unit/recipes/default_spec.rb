#
# Cookbook Name:: apache
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'
# require_relative '../spec_helper.rb'


describe 'apache::default' do
  #TODO check why next (commented) line doesnt compile on mac, but does so on linux and windows(same dk,client,berks,...) 
  # chef_run = ChefSpec::ServerRunner.new.converge('apache::default')
  cached(:chef_run) { ChefSpec::ServerRunner.new.converge(described_recipe) }


  it 'installs apache2' do
    expect(chef_run).to install_package('httpd')

  end

  it 'enables httpd' do
    expect(chef_run).to enable_service('httpd')
  end

  it 'starts httpd' do
    expect(chef_run).to start_service('httpd')
  end

  it 'creates template' do
    expect(chef_run).to create_template('/var/www/html/index.html')
  end

  # context 'When all attributes are default, on an unspecified platform' do

    # let(:chef_run) do
    #   runner = ChefSpec::ServerRunner.new
    #   runner.converge(described_recipe)
    # end
    #
    # it 'converges successfully' do
    #   chef_run # This should not raise an error
    # end

end
