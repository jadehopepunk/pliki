module ActionController
  module Routing
    class RouteSet      
      
      def recognize(request)
        params = recognize_path(request.path, extract_request_environment(request))
        return recognize_instance_plugin_route if params && params[:instance_plugin_route]
        
        request.path_parameters = params.with_indifferent_access
        "#{params[:controller].camelize}Controller".constantize
      end
      

      def call(env)
        request = Request.new(env)
        
        params = recognize_path(request.path, extract_request_environment(request))
        return call_instance_plugin(request, env).to_a if params && params[:instance_plugin_route]
        
        app = Routing::Routes.recognize(request)
        app.call(env).to_a
      end

      protected

        def call_instance_plugin(request, env)
          request, controller_class, page = load_instance_plugin_request(request)
          
          # RAILS HACK: For global rescue to have access to the original request and response          
          request = env["action_controller.rescue.request"] ||= request
          response = env["action_controller.rescue.response"] ||= Response.new          
          
          controller_class.process_plugin_instance(request, response, page)
        end

        def load_instance_plugin_request(request)
          environment = extract_request_environment(request)
          segments = to_plain_segments(request.path)
          
          page_id = get_page_id(segments, request.path, environment)
          page = get_page(page_id)
          route_set = Pliki::PluginRouteSetManager.routes_for(page.plugin_name)
          
          new_params = route_set.recognize_path(plugin_path(request.path), environment).merge(:plugin_page_id => page_id)
          request.path_parameters = new_params.with_indifferent_access
          
          [request, "#{new_params[:controller].camelize}Controller".constantize, page]
        end
        
        
        
        # def recognize_path_with_plugin_routing(path, environment={})
        #   params = recognize_path_without_plugin_routing(path, environment)
        #   raise params.inspect
        # 
        #   segments = to_plain_segments(path)
        #   
        #   page_id = get_page_id(segments, path, environment)
        #   page = get_page(page_id)
        #   
        #   route_set = Pliki::PluginRouteSetManager.routes_for(page.plugin_name)
        #   params = route_set.recognize_path_without_plugin_routing(plugin_path(path), environment)
        #   [params.merge(:plugin_page_id => page_id), page.plugin_name]
        # end
        # 
        # alias_method_chain :recognize_path, :plugin_routing
        
      
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