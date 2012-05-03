class AddForeignToThreads < ActiveRecord::Migration
  def change
    add_column :threds, :topic_id, :integer

  end
end
