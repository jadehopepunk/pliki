# t.string  "name"
# t.string  "permalink"
# t.integer "plugin_instance_id"

module Pliki
  class Node < ActiveRecord::Base
    set_table_name "pliki_nodes"
    has_permalink :name
    
    belongs_to :plugin_instance, :dependent => :destroy
    
    validates_presence_of :name, :permalink, :plugin_instance
    validates_associated :plugin_instance
    
    before_validation_on_create :set_name_from_permalink
    
    def self.find_by_param(param)
      find_by_permalink(param)
    end
    
    def to_param
      permalink
    end
    
    def name_from_permalink
      permalink.gsub('-', '_').titleize
    end
    
    def plugin_name
      plugin_instance.name if plugin_instance
    end
    
    def plugin_name=(value)
      
      self.plugin_instance = PluginInstance.new unless self.plugin_instance
      self.plugin_instance.plugin_name = value
    end
    
    protected
    
      def set_name_from_permalink
        self.name = name_from_permalink if name.blank? && !permalink.blank?
      end
    
  end
end