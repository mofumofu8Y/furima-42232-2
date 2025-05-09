Rails.application.routes.draw do
  # Deviseのルーティング（コントローラーをカスタマイズしている場合）
  devise_for :users
  # トップページ
  root 'items#index'

  # ←ここに記載！
  resources :items
end