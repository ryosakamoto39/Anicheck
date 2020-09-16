class AddUserIdToCommentLikes < ActiveRecord::Migration[5.2]
  def change
    add_column :comment_likes, :user_id, :integer
    add_column :comment_likes, :comment_id, :integer
  end
end
