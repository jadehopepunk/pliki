module ActionController
  module Routing
    class RouteSet
      
      protected
      
        def find_plugin_instance(node_id)
          Pliki::Node.find_by_param(node_id).plugin_instance
        end
      
      
    end
  end
end