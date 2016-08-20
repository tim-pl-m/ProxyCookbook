# Copyright 2015 adesso AG
#
# All rights reserved - Do Not Redistribute
#

require_relative "../support/plugin_helper"

RSpec.configure { |c| c.include PluginHelper }

shared_examples "jenkins plugins" do
  let(:installed_plugins) { jenkins_plugins("127.0.0.1", 8080) }

#without play-autotest-plugin
required_plugins = %w(
  analysis-core analysis-collector async-http-client jquery jacoco token-macro run-condition
  conditional-buildstep promoted-builds build-timeout checkstyle chucknorris cobertura
  copyartifact deploy disk-usage doxygen external-monitor-job pam-auth ant javadoc
  gradle credentials ssh-credentials maven-plugin email-ext job-dsl release
  instant-messaging artifact-promotion global-build-stats findbugs tasks external-monitor-job
  jabber sidebar-link nodejs sbt external-monitor-job ws-cleanup dropdown-viewstabbar-plugin
  testng-plugin translation ssh-agent git-client git repository-connector ssh-slaves m2release
  maven-deployment-linker jobConfigHistory dependency-check-jenkins-plugin jira rebuild
  cloudbees-folder
)

# all
  # required_plugins = %w(
  #   analysis-core analysis-collector async-http-client jquery jacoco token-macro run-condition
  #   conditional-buildstep promoted-builds build-timeout checkstyle chucknorris cobertura
  #   copyartifact deploy disk-usage doxygen external-monitor-job pam-auth ant javadoc
  #   play-autotest-plugin gradle credentials ssh-credentials maven-plugin email-ext job-dsl release
  #   instant-messaging artifact-promotion global-build-stats findbugs tasks external-monitor-job
  #   jabber sidebar-link nodejs sbt external-monitor-job ws-cleanup dropdown-viewstabbar-plugin
  #   testng-plugin translation ssh-agent git-client git repository-connector ssh-slaves m2release
  #   maven-deployment-linker jobConfigHistory dependency-check-jenkins-plugin jira rebuild
  #   cloudbees-folder
  # )

  subject { installed_plugins }
  required_plugins.each do |required|
    it { is_expected.to include(required) }
  end
end
