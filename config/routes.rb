Rails.application.routes.draw do
  devise_for :users
  
  # トップページ
  root 'items#index'

  # 必要なアクションをまとめて1行に定義
  resources :items, only: [:index, :new, :create, :show, :edit, :update, :destroy]

end