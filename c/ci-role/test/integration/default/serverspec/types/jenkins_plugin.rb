module Serverspec
  module Type
    # rubocop:disable PredicateName, CaseEquality
    #
    # delete disable all, when def config is testable
    # rubocop:disable all
    class JenkinsPlugin < Base
      attr_reader :name
      def jenkins_plugin?
        !config.empty?
      end

      def enabled?
        !disabled?
      end

      def disabled?
        ::File.exist?(disabled_plugin)
      end

      def has_version?(version)
        version === config[:plugin_version]
      end

      private

      def disabled_plugin
        "/var/lib/jenkins/plugins/#{name}.jpi.disabled"
      end

      #
      def config
        manifest = "/var/lib/jenkins/plugins/#{name}/META-INF/MANIFEST.MF"
        @config = {}
        lines = ::File.readlines(manifest)
        lines.each_with_index do |line, i|
          next if line.strip.empty?
          next if line.start_with?(' ')

          key, value = line.strip.sub(':', '~||~').split('~||~', 2).map(&:strip)
          key = key.gsub(':', '').gsub(' ', '').gsub('-', '_').downcase.to_sym

          j = i + 1
          while lines[j].start_with?(' ')
            value += lines[j].strip
            j += 1
          end
          @config[key] = value
        end
        return @config
      rescue Errno::ENOENT
        puts e
        @config = {}
      end
    end
  end
end
