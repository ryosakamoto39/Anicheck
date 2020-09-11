class AdduserIdTowantToWatchItems < ActiveRecord::Migration[5.2]
  def change
    add_column :want_to_watch_items, :user_id, :string
    add_column :want_to_watch_items, :item_id, :string
  end
end
