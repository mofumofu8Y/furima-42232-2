class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order

   



  # ActiveHashを使ったアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled_delivery

  # バリデーション
  with_options presence: true do
    validates :name
    validates :description
    validates :image
    validates :category_id
    validates :condition_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :scheduled_delivery_id
    validates :price
  end

  # セレクトが「---」(id: 1)以外であること
  with_options numericality: { other_than: 1, message: 'を選択してください' } do
    validates :category_id
    validates :condition_id
    validates :shipping_fee_id
    validates :prefecture_id
  end
  validates :scheduled_delivery_id, numericality: { other_than: 1, message: 'Delivery day を選択してください' }
  
  # 価格範囲と形式のバリデーション
  validates :price, numericality: {
  only_integer: true,
  greater_than_or_equal_to: 300,
  less_than_or_equal_to: 9_999_999,
  message: 'は¥300〜¥9,999,999の間で入力してください'
}

  # 画像のバリデーション（カスタムバリデーション）
  validate :image_content_type
  validate :image_size




  private

  # 画像のファイルタイプが指定されたものかどうか確認
  def image_content_type
    acceptable_types = ['image/png', 'image/jpg', 'image/jpeg']
    unless acceptable_types.include?(image.content_type)
      errors.add(:image, 'はPNG、JPG、JPEGのいずれかの形式でアップロードしてください')
    end
  end

  # 画像のサイズが5MB以下かどうか確認
  def image_size
    if image.attached? && image.byte_size > 5.megabytes
      errors.add(:image, 'は5MB以下でアップロードしてください')
    end
  end
end