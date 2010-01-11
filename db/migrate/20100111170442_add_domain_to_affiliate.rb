class AddDomainToAffiliate < ActiveRecord::Migration
  def self.up
    add_column :affiliates, :domain, :string
  end

  def self.down
    remove_column :affiliates, :domain
  end
end
