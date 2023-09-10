class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item_item, only: [:index, :create]
  
  def index
    @order_payment = OrderPayment.new
  end

  def create
    @order_payment = OrderPayment.new(order_params)
   if @order_payment.valid?
    @order_payment.save
   redirect_to root_path
   else
    render :index, status: :unprocessable_entity
   end
  end

private
  def order_params
    params.require(:order_payment).permit(:post_code, :region_id, :city, :block, :building_name, :telephone_number).merge(user_id: current_user.id)
  end

  def set_item_item
    @item = Item.find(params[:item_id])
  end
end