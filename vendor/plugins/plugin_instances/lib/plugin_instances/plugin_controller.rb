
module PluginInstances
  class PluginController < ApplicationController
    attr_accessor :plugin_instance

    # Factory for the standard create, process loop where the controller is discarded after processing.
    def self.process_plugin_instance(request, response, plugin_instance)
      new.process_plugin_instance(request, response, plugin_instance)
    end

    def process_plugin_instance(request, response, plugin_instance)
      self.plugin_instance = plugin_instance
      process(request, response)
    end
  
    def initialize_current_url
      @url = PluginInstances::UrlRewriter.new(request, params.clone, route_set)
    end

    def url_for(options = {})
      add_plugin_url_prefix(super)
    end
        
    protected
    
      def add_plugin_url_prefix(url)
        uri = URI.parse(url)
        uri.path = url_prefix + uri.path
        uri.to_s
      end
      
      def url_prefix
        "/pages/#{plugin_instance.id}"
      end
    
      def route_set
        PluginInstances::RouteSetManager.routes_for(plugin_name)
      end
      
      def plugin_name
        plugin_instance.plugin_name
      end
    
  end
end

