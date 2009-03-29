module Pliki
  class Node < ActiveRecord::Base
    set_table_name "pliki_nodes"
    has_permalink :name
    
    belongs_to :plugin_instance, :dependent => :destroy
    
    def self.find_by_param(param)
      find_by_permalink(param)
    end
    
    def to_param
      permalink
    end
    
    def name_from_permalink
      permalink.gsub('-', '_').titleize
    end    
        
  end
end