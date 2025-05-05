Rails.application.routes.draw do
  # ルートパスを設定
  root 'items#index'



  # アプリケーションのヘルスチェック
  get "up" => "rails/health#show", as: :rails_health_check
end

