class CreateWatchedItems < ActiveRecord::Migration[5.2]
  def change
    create_table :watched_items do |t|

      t.timestamps
    end
  end
end
