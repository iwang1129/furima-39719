class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    Item.create(item_params)
    redirect_to root_path
    # 保存した後はトップ画面を表示するためにredirect_toメソッドを使用してroot_path
  end

  private
  def Item_params
    params.require(:item).permit(:name, :image, :explanation).merge(user_id: current_user.id)
    # user.idには、itemを投稿したユーザーのidを保存する処理を記述＝現在ログインしているユーザー＝current_userのid
  end
end
