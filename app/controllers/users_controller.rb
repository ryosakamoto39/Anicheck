class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @currentUserEntry=Entry.where(user_id: current_user.id)
    @userEntry=Entry.where(user_id: @user.id)
    unless @user.id == current_user.id
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end

    @type = params[:type] || "review"

    if @type == "review"
      @results = @user.reviews.includes(:item)
      respond_to do |format|
        format.js
        format.html
      end
      return
    end

    if @type == "want_to_watch_item"
     item_ids = "SELECT item_id FROM want_to_watch_items WHERE user_id = :user_id"
     @results = Item.where("id IN (#{item_ids})", user_id: @user.id)
     respond_to do |format|
       format.js
       format.html
     end
     return
   end

    if @type == "watched_item"
      item_ids = "SELECT item_id FROM watched_items WHERE user_id = :user_id"
      @results = Item.where("id IN (#{item_ids})", user_id: @user.id)
      respond_to do |format|
        format.js
        format.html
      end
      return
    end

    if @type == "liked_review"
      review_ids = "SELECT review_id FROM review_likes WHERE user_id = :user_id"
      @results = Review.where("id IN (#{review_ids})", user_id: @user.id).includes(:item)
      respond_to do |format|
        format.js
        format.html
      end
      return
    end

    if @type == "following"
      @results = @user.following
      respond_to do |format|
        format.js
        format.html
      end
      return
    end

    return unless @type == "follower"

    @results = @user.followers
    respond_to do |format|
      format.js
      format.html
    end
  end
  
end
