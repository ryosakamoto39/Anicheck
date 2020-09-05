class AddStoryToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :story, :text
  end
end
