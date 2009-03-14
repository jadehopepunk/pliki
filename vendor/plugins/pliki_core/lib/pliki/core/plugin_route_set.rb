module Pliki
  module Core
    class PluginRouteSet < ActionController::Routing::RouteSet
      
      def initialize(plugin_name)
        super()
        @plugin_name = plugin_name
      end
      
      def recognize_path_without_plugin_routing(path, environment={})
        super
      rescue ActionController::RoutingError => e
        raise ActionController::RoutingError, e.message + " for plugin \"#{@plugin_name}\""
      end
      
    end
  end
end