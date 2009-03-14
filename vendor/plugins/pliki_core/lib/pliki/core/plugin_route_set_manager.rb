module Pliki
  module Core
    class PluginRouteSetManager
      @@route_sets = {}
      
      def self.routes_for(plugin_name)
        @@route_sets[plugin_name] ||= PluginRouteSet.new(plugin_name)
      end
    end
  end
end