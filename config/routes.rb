Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :items, only: :index
  # Defines the root path route ("/")
  root to: 'items#index'
  # トップページを表示する
end
