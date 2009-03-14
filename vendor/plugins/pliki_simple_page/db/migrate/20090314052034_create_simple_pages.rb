class CreateSimplePages < ActiveRecord::Migration
  def self.up
    create_table :simple_pages do |t|
      t.text :body
    end
  end

  def self.down
    drop_table :simple_pages
  end
end
