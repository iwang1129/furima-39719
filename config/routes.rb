Rails.application.routes.draw do
  devise_for :users
  # devise_forは、ユーザー機能に必要な複数のルーティングを一度に生成してくれるdeviseのメソッド
  # % rails g devise userでユーザーに関する、モデルやマイグレーションも自動生成。
  root to: 'items#index'
  # トップページを表示する
  resources :items, only: [:index, :new, :create]
  
 
end
