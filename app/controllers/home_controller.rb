class HomeController < ApplicationController
  def top
    @digest_length = 60
    @item_select = 7

    popular_ids = Review.popular_ids
    review_select = 7

    popular_reviews_all = Review.where(id: popular_ids).order([Arel.sql('field(id, ?)'), popular_ids]).where.not(user_id: @current_user&.block_ids).where.not('content like ?','%netabare%')
    @popular_reviews = popular_reviews_all.limit(review_select)

    # --------------------------------------------------------------------------------

    from = Time.zone.now - 3.days
    to = Time.zone.now
    @recent_reviews = popular_reviews_all.where(created_at: from..to).limit(review_select)

    limit_period = 7
    select_period = 0
    while @recent_reviews.count < review_select
      select_period += 1
      from = Time.zone.now - select_period.day
      break if select_period > limit_period

      @recent_reviews = popular_reviews_all.where(created_at: from..to).limit(review_select)
    end

    # --------------------------------------------------------------------------------

    popular_ids = Item.popular_ids
    @popular_items = Item.where(id: Item.popular_ids).where(id: popular_ids).order([Arel.sql('field(id, ?)'), popular_ids]).limit(@item_select)

    watched_ids = Item.watched_ids
    @watched_items = Item.where(id: watched_ids).order([Arel.sql('field(id, ?)'), watched_ids]).limit(@item_select)

    want_to_watch_ids = Item.want_to_watch_ids
    @want_to_watch_items = Item.where(id: want_to_watch_ids).order([Arel.sql('field(id, ?)'), want_to_watch_ids]).limit(@item_select)

    tag_select = 3
    @most_used_tags = ActsAsTaggableOn::Tag.most_used(tag_select)
  end
end
