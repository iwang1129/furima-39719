class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.includes(:user).order('created_at DESC')
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

  def show
    @item = Item.find(params[:id])
  end
  private

  def item_params
    params.require(:item).permit(:name, :image, :explanation, :category_id, :situation_id, :load_id, :region_id, :shipping_id,
                                 :price).merge(user_id: current_user.id)
  end
end
