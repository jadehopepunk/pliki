class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string  :plugin_name
    end
  end

  def self.down
  end
end
