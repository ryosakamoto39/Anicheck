class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "作成しました"
      redirect_to "/items/#{@item.id}"
    else
      rollback
      flash.now[:notice] = "作成に失敗しました"
      render 'new'
    end
  end

  def update
    @item = Item.find(params[:id]).update(item_params)
    @item = Item.find(params[:id])
    flash[:notice] = "更新しました"
    redirect_to "/items/#{@item.id}"
  end

    private

      def item_params
        params.require(:item).permit(
        :title, :story, :image
      )
      end


end
