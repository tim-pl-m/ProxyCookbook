# Copyright 2015 adesso AG
#
# All rights reserved - Do Not Redistribute
#

require_relative "support/spec_helper"
require_relative "examples/jenkins_service"

describe "master_basic setup" do
  it_behaves_like "jenkins service"
end
