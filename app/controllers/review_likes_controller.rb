class ReviewLikesController < ApplicationController

  def create
    @review = Review.find(params[:review_id])
    ReviewLike.create(user_id: @current_user.id, review_id: review.id)

    respond_to do |format|
      format.js
    end
  end

  def destroy
    @review = Review.find(params[:id])
    ReviewLike.find_by(user_id: @current_user.id, review_id: params[:id]).destroy

    respond_to do |format|
      format.js
    end
  end

end
