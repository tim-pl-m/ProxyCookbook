# do
#   'bundle install'
# end

# #remove project-specific settings
# rm -rf .bundle/
#
# # remove project-specific cached gems and repos
# rm -rf vendor/cache/
#
# # remove the saved resolve of the Gemfile
# rm -rf Gemfile.lock

# require 'bundler/cli'
# Bundler::CLI.new.invoke(:install)

colorized_output = true

require 'bundler'
Bundler.with_clean_env do
  'bundle install'
end