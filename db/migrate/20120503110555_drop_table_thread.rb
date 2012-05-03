class DropTableThread < ActiveRecord::Migration
  drop_table :threads
  
  def change
    add_column :posts, :thred_id, :integer
    remove_column :posts, :thread_id, :integer
  end
  
end
