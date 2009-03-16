# Include hook code here
require 'models/page.rb'

dir = File.expand_path(File.dirname(__FILE__) + '/lib/')

require File.expand_path(dir + '/ruby/object.rb')

require File.expand_path(dir + '/rails/plugin')
require File.expand_path(dir + '/rails/abstract_request')
require File.expand_path(dir + '/rails/route_set')

require File.expand_path(dir + '/pliki/form_builder')
require File.expand_path(dir + '/pliki/plugin')
require File.expand_path(dir + '/pliki/plugin_templates/action_controller')
require File.expand_path(dir + '/pliki/plugin_templates/action_view')

ApplicationHelper.class_eval("include Pliki::Helpers::FormHelper")
