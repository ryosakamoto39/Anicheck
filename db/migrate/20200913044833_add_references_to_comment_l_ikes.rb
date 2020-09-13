class AddUserIdToCommentLIkes < ActiveRecord::Migration[5.2]
  def change
    add_column :comment_likes, :user_id
    add_column :comment_likes, :comment_id
  end
end
