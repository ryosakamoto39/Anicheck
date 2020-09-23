class WantToWatchItemsController < ApplicationController
  before_action :authenticate_user!

  def create
    @item = Item.find(params[:item_id])
    WantToWatchItem.create(user_id: current_user.id, item_id: @item.id)
    @count = params[:count].to_i + 1

    respond_to do |format|
      format.js
    end
  end

  def destroy
    @item = Item.find(params[:id])
    WantToWatchItem.find_by(user_id: current_user.id, item_id: params[:id]).destroy
    @count = params[:count].to_i - 1

    respond_to do |format|
      format.js
    end
  end


end
