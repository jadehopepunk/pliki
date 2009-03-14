class AddVersioningToSimplePages < ActiveRecord::Migration
  def self.up
    add_column :simple_pages, :version, :integer
  end

  def self.down
    remove_column :simple_pages, :version
  end
end
