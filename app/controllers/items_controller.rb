class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
    @reviews = Review.where(item_id: params[:id]).page(params[:page]).per(5)
    @average_rate = Review.where(Item_id: params[:id]).average(:score)
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

  def destroy
    @item = Item.find_by(id: params[:id])
    if @item&.destroy
      flash[:notice] = "作品を削除しました"
      redirect_to items_path
    else
      flash[:notice] = "削除に失敗しました"
      redirect_to "/items/#{@item.id}"
    end
  end

    private

      def item_params
        params.require(:item).permit(
        :title, :story, :image
      )
      end


end
