class AddContentToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :content, :text
    add_column :reviews, :score,  :float
    add_column :reviews, :image, :string
    add_column :reviews, :user_id, :integer
    add_column :reviews, :item_id, :integer

  end
end
