class CreateWantToWatchItems < ActiveRecord::Migration[5.2]
  def change
    create_table :want_to_watch_items do |t|

      t.timestamps
    end
  end
end
