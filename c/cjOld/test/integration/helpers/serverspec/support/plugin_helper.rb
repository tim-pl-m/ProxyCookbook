# Copyright 2015 adesso AG
#
# All rights reserved - Do Not Redistribute
#

require 'net/http'
require 'rexml/document'

# Useful helper methods to test Jenkins
module PluginHelper
  def query_jenkins_plugins(host, port)
    uri = URI::HTTP.build(
      host: host,
      port: port,
      path: "/pluginManager/api/xml",
      query: "depth=1"
    )
    Net::HTTP.get(uri)
  end

  def jenkins_plugins(host, port)
    xml = REXML::Document.new(query_jenkins_plugins(host, port))
    xml.elements.to_a("/*/*/shortName").map(&:text)
  end

  # Given that is is used on local tests only we will ignore the eval warning.
  # rubocop:disable Lint/Eval
  def load_plugin_hash_from_attributes(path)
    eval File.load(path).delete("\n").gsub(/default\[.*\] = {/)
  end
end

if __FILE__ == $PROGRAM_NAME
  include JenkinsHelper
  response = query_jenkins_plugins("localhost", 8080)
  puts response

  jenkins_plugins("127.0.0.1", 8080)
end
