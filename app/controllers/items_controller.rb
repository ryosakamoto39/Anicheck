class ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "作成しました"
      #redirect_to "/items/#{@item.id}"
      render 'new'
    else
      rollback
      flash.now[:notice] = "作成に失敗しました"
      render 'new'
    end
  end

    private

      def item_params
        params.require(:item).permit(
        :title, :story, :image
      )
      end


end
