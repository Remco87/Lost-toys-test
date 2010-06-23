class AddToysCountToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :toys_count, :integer, :default => 0
  end

  def self.down
    remove_column :users, :toys_count
  end
end
