Rails.application.routes.draw do
  devise_for :users

  # トップページ
  root 'items#index'

  # itemsとネストするorders（購入機能）
  resources :items do
    resources :orders, only: [:index, :create]
  end
end
