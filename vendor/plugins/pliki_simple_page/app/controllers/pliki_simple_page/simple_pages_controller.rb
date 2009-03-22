module PlikiSimplePage
  class SimplePagesController < PluginInstances::PluginController
    before_filter :load_simple_page, :only => [:show, :edit]
  
    def show
      redirect_to(:action => 'edit') unless @simple_page
    end
    
    def edit
    end
    
    def create
      @simple_page = load_simple_page || SimplePage.new(:plugin_instance_id => plugin_instance.id)
      @simple_page.attributes = params[:simple_page]
      @success = @simple_page.save
      
      if @success 
        redirect_to(:action => 'show')
      else
        render :action => :edit
      end
    end
    
    protected
        
      def load_simple_page
        @simple_page = SimplePage.find_by_id(plugin_instance.id)
      end
  
  end
end