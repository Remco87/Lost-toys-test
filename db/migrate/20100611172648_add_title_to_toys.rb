class AddTitleToToys < ActiveRecord::Migration
  def self.up
    add_column :toys, :title, :string
  end

  def self.down
    remove_column :toys, :title
  end
end
