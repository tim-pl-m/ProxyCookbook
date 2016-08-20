# Copyright 2015 adesso AG
#
# All rights reserved - Do Not Redistribute
#

require_relative "../spec_helper.rb"

describe 'ciexjenkins::_jenkins_dummy_service' do
  cached(:chef_run) { ChefSpec::ServerRunner.new.converge(described_recipe) }

  it "declares a jenkins service resource that does nothing" do
    expect(chef_run.find_resource("service", "jenkins")).to do_nothing
  end
end
