module PlikiSimplePage
  class PagesController < ActionController::Base
  
    def index
      respond_to :html
    end
  
  end
end