require 'bundler'
Bundler::GemHelper.install_tasks

require 'rspec/core/rake_task'
require 'spree/testing_support/extension_rake'

if ENV['RAILS_ENV'] == 'development'

  require File.expand_path('spec/dummy/config/environment.rb')

  Rails.application.load_tasks
end

RSpec::Core::RakeTask.new

task :default do
  if Dir["spec/dummy"].empty?
    Rake::Task[:test_app].invoke
    Dir.chdir("../../")
  end
  Rake::Task[:spec].invoke
end

desc 'Generates a dummy app for testing'
task :test_app do
  ENV['LIB_NAME'] = 'spree_call_to_action_gallery'
  Rake::Task['extension:test_app'].invoke
end
