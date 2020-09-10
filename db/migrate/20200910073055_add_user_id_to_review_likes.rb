class AddUserIdToReviewLikes < ActiveRecord::Migration[5.2]
  def change
    add_column :review_likes, :user_id, :string
    add_column :review_likes, :review_id, :string
  end
end
