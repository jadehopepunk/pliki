module Pliki
  class PluginController < ApplicationController
    before_filter :load_page

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
        "/page/#{@page.id}"
      end
    
      def load_page
        @page = Page.find(params[:plugin_page_id])
      end
      
      def route_set
        Pliki::PluginRouteSetManager.routes_for(plugin_name)
      end
      
      def plugin_name
        request.plugin_name
      end
    
  end
end