Rails.application.routes.draw do
  devise_for :users
  # ルートパスを設定
  root 'items#index'



  # アプリケーションのヘルスチェック
  get "up" => "rails/health#show", as: :rails_health_check
end

