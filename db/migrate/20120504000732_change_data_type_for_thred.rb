class ChangeDataTypeForThred < ActiveRecord::Migration
  def self.up
    rename_column :threds, :lastposterid, :last_poster_id
    rename_column :threds, :lastpostat, :last_post_at
    change_table :threds do |t|
      t.change :last_post_at, :datetime
    end
  end

  def down
  end
end
