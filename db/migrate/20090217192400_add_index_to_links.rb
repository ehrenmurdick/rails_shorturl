class AddIndexToLinks < ActiveRecord::Migration
  def self.up
    add_index :links, :short
  end

  def self.down
    remove_index :links, :column => :short
  end
end
