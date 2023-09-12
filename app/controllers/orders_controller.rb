class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item_item, only: [:index, :create]
  
  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_payment = OrderPayment.new
  end

  def create
    @order_payment = OrderPayment.new(order_params)
   if @order_payment.valid?
    pay_item
    @order_payment.save
   redirect_to root_path
   else
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    render :index, status: :unprocessable_entity
   end
  end

private
  def order_params
    params.require(:order_payment).permit(:post_code, :region_id, :city, :block, :building_name, :telephone_number, :token).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
  # margeするものは入力ファームにはないが保存処理に必要なもの必要なもの

  def set_item_item
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id || @item.order.present?
  end

  def pay_item
     Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
      amount: @item[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  
end