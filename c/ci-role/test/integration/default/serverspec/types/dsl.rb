module RSpec
  module Core
    #
    module DSL
      def jenkins_plugin(name)
        Serverspec::Type::JenkinsPlugin.new(name)
      end
    end
  end
end

extend RSpec::Core::DSL
Module.send(:include, RSpec::Core::DSL)
