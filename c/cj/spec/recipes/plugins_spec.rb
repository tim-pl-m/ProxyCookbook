# Copyright 2015 adesso AG
#
# All rights reserved - Do Not Redistribute
#

require_relative '../spec_helper.rb'

describe 'ciexjenkins::plugins' do
  before do
    allow(Chef::EncryptedDataBagItem).to receive(:load).with('dev', 'credentials').and_return(
      {
        ad: {
          username: "test",
          password: "test123"
        },
        jenkins_cli: {
          username: "test",
          password: "test123"
        }
      }
    )
  end
  
  cached(:chef_run) { ChefSpec::ServerRunner.new.converge(described_recipe) }
  let(:plugins) { chef_run.node["ciexjenkins"]["plugins"].keys }

  it "installs a shit ton of plugins" do
    plugins.each do |plugin|
      expect(chef_run).to install_jenkins_plugin(plugin)
    end
  end

  it "notifies jenkins to restart if any of the plugins change installation state" do
    plugins.each do |plugin|
      expect(chef_run.find_resource("jenkins_plugin", plugin)).to(
        notify("service[jenkins]").to(:restart)
      )
    end
  end
end
