class AddUserIdToWatchedItems < ActiveRecord::Migration[5.2]
  def change
    add_column :watched_items, :user_id, :string
    add_column :watched_items, :item_id, :string
  end
end
