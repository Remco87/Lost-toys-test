class AddGeoCodingToToys < ActiveRecord::Migration
  def self.up
    add_column :toys, :zipcode, :string
    add_column :toys, :lat, :float
    add_column :toys, :lng, :float
  end

  def self.down
    remove_column :toys, :lng
    remove_column :toys, :lat
    remove_column :toys, :zipcode
  end
end
