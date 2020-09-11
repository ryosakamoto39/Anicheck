class WatchedItemsController < ApplicationController

  def create
    @item = Item.find(params[:item_id])
    WatchedItem.create(user_id: current_user.id, item_id: @item.id)
    @count = params[:count].to_i + 1

    respond_to do |format|
      format.js
    end
  end

  def destroy
    @item = Item.find(params[:id])
    WatchedItem.find_by(user_id: current_user.id, item_id: params[:id]).destroy
    @count = params[:count].to_i - 1

    respond_to do |format|
      format.js
    end
  end

end
