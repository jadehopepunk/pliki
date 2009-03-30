module Pliki
  class PluginController < PluginInstances::PluginController
    before_filter :set_title_from_node
    
    protected
    
      def node
        plugin_instance.node if plugin_instance
      end
      
      def set_title_from_node
        @title = node.name
      end
    
  end
end