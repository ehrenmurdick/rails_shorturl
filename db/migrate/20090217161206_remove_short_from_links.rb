class RemoveShortFromLinks < ActiveRecord::Migration
  def self.up
    remove_column :links, :short
  end

  def self.down
    add_column :links, :short, :string
  end
end
