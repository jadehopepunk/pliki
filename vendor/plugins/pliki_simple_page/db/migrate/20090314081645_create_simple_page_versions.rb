class CreateSimplePageVersions < ActiveRecord::Migration
  class SimplePage < ActiveRecord::Base
    acts_as_versioned
  end

  def self.up
    SimplePage.create_versioned_table
  end

  def self.down
    SimplePage.drop_versioned_table
  end
end
