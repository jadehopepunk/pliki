module Pliki
  class PluginController < ApplicationController
    attr_accessor :page

    # Factory for the standard create, process loop where the controller is discarded after processing.
    def self.process_plugin_instance(request, response, page)
      new.process_plugin_instance(request, response, page)
    end

    def process_plugin_instance(request, response, page)
      self.page = page
      process(request, response)
    end
  
    def initialize_current_url
      @url = Pliki::UrlRewriter.new(request, params.clone, route_set)
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
        "/pages/#{@page.id}"
      end
    
      def route_set
        Pliki::PluginRouteSetManager.routes_for(plugin_name)
      end
      
      def plugin_name
        page.plugin_name
      end
    
  end
end