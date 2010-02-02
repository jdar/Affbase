class AddGeocodeToAffiliates < ActiveRecord::Migration
  def self.up
    add_column :affiliates, :lat, :float
    add_column :affiliates, :long, :float
  end

  def self.down
    remove_column :affiliates, :long
    remove_column :affiliates, :lat
  end
end
