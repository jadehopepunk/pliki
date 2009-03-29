class CreatePlikiNodes < ActiveRecord::Migration
  def self.up
    create_table :pliki_nodes do |t|
      t.string :name, :permalink
      t.integer :plugin_instance_id
    end
    add_index :pliki_nodes, :permalink
  end

  def self.down
    drop_table :pliki_nodes
  end
end
