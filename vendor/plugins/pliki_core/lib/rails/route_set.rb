module ActionController
  module Routing
    class RouteSet      
      def recognize_path_with_plugin_routing(path, environment={})
        segments = to_plain_segments(path)
        
        page_id = get_page_id(segments, path, environment)
        page = get_page(page_id)
        
        route_set = Pliki::PluginRouteSetManager.routes_for(page.plugin_name)
        params = route_set.recognize_path_without_plugin_routing(plugin_path(path), environment)
        [params.merge(:plugin_page_id => page_id), page.plugin_name]
      end
      
      alias_method_chain :recognize_path, :plugin_routing

      def recognize(request)
        params, plugin_name = recognize_path(request.path, extract_request_environment(request))
        request.path_parameters = params.with_indifferent_access
        request.plugin_name = plugin_name
        "#{params[:controller].camelize}Controller".constantize
      end

      protected
            
        def get_page(page_id)
          Page.find(page_id)
        end
      
        def get_page_id(segments, path, environment)
          if segments.length >= 2 && segments[0] == 'pages'
            segments[1]
          else
            raise RoutingError, "No pliki route matches #{path.inspect} with #{environment.inspect}"
          end
        end
      
        def plugin_path(path)
          path.gsub(/^\/pages\/[^\/?]*/, '')
        end
      
    end
  end
end