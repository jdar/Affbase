class CreateAffiliates < ActiveRecord::Migration
  def self.up
    create_table :affiliates do |t|
      t.string :org_name
      t.string :url

      t.timestamps
    end
  end

  def self.down
    drop_table :affiliates
  end
end
