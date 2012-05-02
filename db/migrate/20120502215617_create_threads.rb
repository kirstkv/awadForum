class CreateThreads < ActiveRecord::Migration
  def self.up
    create_table :threads do |t|
      t.string :name
      t.integer :lastposterid
      t.datet :lastpostat
      t.timestamps
    end
  end

  def self.down
    drop_table :threads
  end
end
