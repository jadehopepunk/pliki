# create_table :simple_pages do |t|
#   t.text :body
# end

class SimplePage < ActiveRecord::Base
  validates_presence_of :body, :plugin_instance_id
  
end