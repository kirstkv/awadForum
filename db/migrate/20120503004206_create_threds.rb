class CreateThreds < ActiveRecord::Migration
  def self.up
    create_table :threds do |t|
      t.string :name
      t.integer :lastposterid
      t.date :lastpostat
      t.integer :topic_id
      t.timestamps
    end
  end

  def self.down
    drop_table :threds
  end
end
