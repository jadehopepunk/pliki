module PlikiSimplePage
  class SimplePagesController < Pliki::PluginController
    before_filter :load_simple_page, :only => [:show, :edit]
  
    def show
      redirect_to(:action => 'edit') unless @simple_page
    end
    
    def edit
    end
    
    def create
      @simple_page = load_simple_page || SimplePage.new
      @simple_page.attributes = params[:simple_page]
      @success = @simple_page.save
      
      respond_to do |format|
        if @success 
          format.html { redirect_to(:action => 'show') }        
        else
          render :action => :edit
        end
      end      
    end
    
    protected
        
      def load_simple_page
        @simple_page = SimplePage.find_by_id(params[:plugin_page_id])
      end
  
  end
end