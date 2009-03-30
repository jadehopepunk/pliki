Factory.define :node, :class => Pliki::Node do |f|
  f.permalink "some-page"
  f.association :plugin_instance
end