ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../../../../config/environment")
require 'spec'
require 'spec/rails'
require File.expand_path(File.dirname(__FILE__) + "/../../plugin_instances/spec/factories.rb")
require File.expand_path(File.dirname(__FILE__) + "/factories")

Spec::Runner.configure do |config|
  config.fixture_path = "#{File.dirname(__FILE__)}/../spec/fixtures"
end
