class AddForeignToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :thread_id, :integer

  end
end
