class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @item = Item.find_by(id: params[:item_id])
  end

  def create
    @review = Review.new(review_params)
    @item = Item.find_by(id: params[:review][:item_id])

    if @review.save
      flash[:notice] = "作成しました"
      redirect_to "/items/#{@item.id}?review_id=#{@review.id}"
    else
      flash.now[:notice] = "作成に失敗しました"
      render 'new'
    end
  end



    private

      def review_params
        params.require(:review).permit(
        :content, :score, :item_id, :user_id, :image,
#        :tag_list
        )
      end

end
