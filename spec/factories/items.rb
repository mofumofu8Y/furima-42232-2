FactoryBot.define do
  factory :item do
    name              { 'テスト商品' }
    description       { 'これはテスト用の商品です' }
    price             { 1000 }
    category_id       { 2 }  # ActiveHashのデフォルト値以外（1はバリデーションで弾く）
    condition_id      { 2 }
    shipping_fee_id   { 2 }
    prefecture_id     { 2 }
    scheduled_delivery_id { 2 }  # ActiveHashの初期値1以外（バリデで除外される）
    association :user

    after(:build) do |item|
      item.image.attach(
        io: File.open(Rails.root.join('spec/fixtures/files/test_image.png')),
        filename: 'test_image.png',
        content_type: 'image/png'
      )
    end
  end
end