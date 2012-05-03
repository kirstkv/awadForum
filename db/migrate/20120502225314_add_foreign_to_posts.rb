class AddForeignToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :thred_id, :integer

  end
end
