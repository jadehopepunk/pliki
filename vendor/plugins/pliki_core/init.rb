# Include hook code here

dir = File.expand_path(File.dirname(__FILE__) + '/lib/')

require File.expand_path(dir + '/pliki/form_builder')

ActionView::Base.class_eval("include Pliki::Helpers::FormHelper")
