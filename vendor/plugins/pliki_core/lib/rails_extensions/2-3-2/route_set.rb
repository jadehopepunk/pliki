module ActionController
  module Routing
    class RouteSet
      
      protected
      
        def find_plugin_instance(node_id)
          node = Pliki::Node.find_by_param(node_id)
          node ? node.plugin_instance : nil
        end

        def call_plugin_not_found(request, env, plugin_instance_id)
          call_redirect(request, :controller => 'nodes', :action => 'new', :permalink => plugin_instance_id)
        end
      
    end
  end
end