class AddForeignToThreads < ActiveRecord::Migration
  def change
    add_column :threads, :topic_id, :integer

  end
end
