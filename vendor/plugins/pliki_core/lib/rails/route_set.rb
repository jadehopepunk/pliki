module ActionController
  module Routing
    class RouteSet
      NODE_RESOURCE_NAME = 'page'
      
      def recognize_path(path, environment={})
        segments = to_plain_segments(path)
        
        page_id = get_page_id(segments)
        
        

        raise page_id.inspect
        # index = #{body}
        # return nil unless index
        # while index < routes.size
        #   result = routes[index].recognize(path, env) and return result
        #   index += 1
        # end
        # nil

      end
      
      def get_page_id(segments)
        if segments.length >= 2 && segments[0] == NODE_RESOURCE_NAME
          segments[1]
        else
          raise RoutingError, "No route matches #{path.inspect} with #{environment.inspect}"
        end
      end
      
      
    end
  end
end