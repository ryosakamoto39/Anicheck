class SearchController < ApplicationController
  after_action :respond, only: %i[show]

  def show
    @keyword = params[:keyword] || ""
    @keyword == "" ? (@digest = "全件の検索結果") : (@digest = "「#{@keyword}」の検索結果")
    @type = params[:type] || "item"

    @items = Item.search(@keyword)
    @reviews = Review.search(@keyword).where.not(user_id: @current_user&.block_ids)
    @users = User.search(@keyword).where(admin: false)
    @tags = ActsAsTaggableOn::Tag.where('name like ?', "%" + @keyword + "%")

    return (@results = @items) if @type == "item"
    return (@results = @reviews) if @type == "review"
    return (@results = @users) if @type == "user"
    return redirect_to "/" unless @type == "tag"

    @results = @tags
  end

  private

  def respond
    respond_to do |format|
      format.js
      format.html
    end
  end

end
