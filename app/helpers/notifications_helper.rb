module NotificationsHelper
  def notification_form(notification)
    #通知を送ってきたユーザーを取得
    @visitor = notification.visitor
    #コメントの内容を通知に表示する
    @comment = nil
    @visitor_comment = notification.comment_id
    # notification.actionがfollowかlikeかcommentかで処理を変える
    case notification.action
    when 'follow'
      #aタグで通知を作成したユーザーshowのリンクを作成
      tag.a(notification.visitor.name, href: user_path(@visitor)) + 'さんがあなたをフォローしました'
    when 'like'
      tag.a(notification.visitor.name, href: user_path(@visitor)) + 'が' + tag.a('あなたのレビュー', href: item_path(notification.review.item.id)) + 'にいいねしました'
    when 'comment' then
      #コメントの内容と投稿のタイトルを取得　
      @comment = Comment.find_by(id: @visitor_comment)
      @comment_content = @comment.content
      @review_title = @comment.review.item.title
      tag.a(@visitor.name, href: user_path(@visitor)) + 'が' + tag.a("#{@review_title}", href: item_path(notification.review.item.id)) + 'にコメントしました'
    end
  end
end
