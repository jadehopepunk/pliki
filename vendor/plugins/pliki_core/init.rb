# Include hook code here

dir = File.expand_path(File.dirname(__FILE__) + '/lib/')

require File.expand_path(dir + '/pliki/form_builder')
require File.expand_path(dir + '/rails_extensions/2-3-2/route_set')
require File.expand_path(dir + '/plugin_instances_extensions/plugin_instance')

ActionView::Base.send(:include, Pliki::Helpers::FormHelper)
ActiveRecord::Base.send(:include, Pliki::CanContainWikilinks)
