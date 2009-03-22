#   t.text :body
#   t.integer :plugin_instance_id

class SimplePage < ActiveRecord::Base
  validates_presence_of :body, :plugin_instance_id
  
  acts_as_textiled :body
  
end