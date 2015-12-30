#!/usr/bin/env rake

# Rakefile
require 'bundler/setup'

# Style tests. Rubocop and Foodcritic
# TODO activate style-tests

# namespace :style do
#   begin
#     require 'rubocop/rake_task'
#     desc 'Run Ruby style checks'
#     RuboCop::RakeTask.new(:ruby)
#   rescue LoadError
#     puts '>>>>> Rubocop gem not loaded, omitting tasks' unless ENV['CI']
#   end
#
#   begin
#     require 'foodcritic'
#
#     desc 'Run Chef style checks'
#     FoodCritic::Rake::LintTask.new(:chef) do |t|
#       t.options = {
#         fail_tags: ['any'],
#         exclude_paths: ['spec']
#       }
#     end
#   rescue LoadError
#     puts '>>>>> foodcritic gem not loaded, omitting tasks' unless ENV['CI']
#   end
# end
#
# desc 'Run all style checks'
# task style: ['style:chef', 'style:ruby']

# Integration tests. Kitchen.ci
#TODO consider vagrant-tests

# namespace :integration do
#   begin
#     require 'kitchen/rake_tasks'
#
#     desc 'Run kitchen integration tests'
#     Kitchen::RakeTasks.new
#   rescue LoadError, Kitchen::ClientError
#     puts '>>>>> Kitchen gem not loaded, omitting tasks' unless ENV['CI']
#   end
# end

namespace :integration do
  # desc 'Run integration tests with kitchen-docker'
  # task :docker do
  #   require 'kitchen'
  #   Kitchen.logger = Kitchen.default_file_logger
  #   @loader = Kitchen::Loader::YAML.new(local_config: '.kitchen.docker.yml')
  #   Kitchen::Config.new(loader: @loader).instances.each do |instance|
  #     instance.test(:always)
  #   end
  # end
  desc 'Run integration tests with kitchen-docker'
  task :docker, [:regexp, :action] do |_t, args|
    run_kitchen(args.action, args.regexp, local_config: '.kitchen.docker.yml')
  end
end


# Unit tests with rspec/chefspec
# TODO activate rspec

# namespace :unit do
#   begin
#     require 'rspec/core/rake_task'
#     desc 'Run unit tests with RSpec/ChefSpec'
#     RSpec::Core::RakeTask.new(:rspec) do |t|
#       t.rspec_opts = [].tap do |a|
#         a.push('--color')
#         a.push('--format progress')
#       end.join(' ')
#     end
#   rescue LoadError
#     puts '>>>>> rspec gem not loaded, omitting tasks' unless ENV['CI']
#   end
# end
#
# task unit: ['unit:rspec']

desc 'Run all tests on Travis'
# task travis: %w(style unit)

# Default
task default: ['integration:kitchen:all']
# task default: ['style', 'unit', 'integration:kitchen:all']
