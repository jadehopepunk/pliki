module PlikiSimplePage
  class SimplePagesController < Pliki::PluginController
    before_filter :load_simple_page
  
    def show
      redirect_to(:action => 'edit', :id => '1', :controller => 'pliki_simple_page/simple_pages') unless @simple_page
    end
    
    def edit
    end
    
    protected
    
      def load_simple_page
        @simple_page = SimplePage.find_by_id(params[:plugin_page_id])
      end
  
  end
end