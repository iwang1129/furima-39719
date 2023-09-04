class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :explanation, :category_id, :situation_id, :load_id, :region_id, :shipping_id, :price).merge(user_id: current_user.id)
  end

end
