# Copyright 2015 adesso AG
#
# All rights reserved - Do Not Redistribute
#

require_relative "support/spec_helper"
require_relative "examples/plugins"
require_relative "examples/jenkins_service"

describe "jenkins service" do
  it_behaves_like "jenkins service"
end

# TODO deactivate somewhere else!!!1!

# describe "installed plugins" do
#   include_examples "jenkins plugins"
# end


