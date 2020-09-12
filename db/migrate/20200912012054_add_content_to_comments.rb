class AddContentToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :content, :string
    add_column :comments, :user_id, :string
    add_column :comments, :review_id, :string
  end
end
