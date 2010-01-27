class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.integer :affiliate_id
      t.string :name
      t.string :url
      t.timestamp :date
      t.string :location

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
