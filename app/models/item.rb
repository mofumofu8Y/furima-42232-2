class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions



  belongs_to :user
  has_one_attached :image
belongs_to :days_to_ship, class_name: "DaysToShip"
  has_one :order

   



  # ActiveHashを使ったアソシエーション

  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled_delivery

 # バリデーション
validates :name, presence: { message: "can't be blank" }
validates :description, presence: { message: "can't be blank" }
validates :image, presence: { message: "can't be blank" }
validates :price, presence: { message: "can't be blank" }

# セレクトが「---」(id: 1)以外であること
# この形に統一すればOK
with_options numericality: { other_than: 1, message: 'must be selected' } do
  validates :category_id
  validates :condition_id
  validates :shipping_fee_id
  validates :prefecture_id
end

validates :scheduled_delivery_id, numericality: { other_than: 1, message: 'Delivery day must be selected' }

# 価格範囲と形式のバリデーション
validates :price, numericality: {
  only_integer: true,
  greater_than_or_equal_to: 300,
  less_than_or_equal_to: 9_999_999,
  message: 'must be between ¥300 and ¥9,999,999'
}

def sold_out?
  order.present?
end

  # 画像のバリデーション（カスタムバリデーション）
  validate :image_content_type
  validate :image_size




  private

  # 画像のファイルタイプが指定されたものかどうか確認
  def image_content_type
    acceptable_types = ['image/png', 'image/jpg', 'image/jpeg']
    unless acceptable_types.include?(image.content_type)
      errors.add(:image, 'must be PNG, JPG, or JPEG format')
    end
  end

  # 画像のサイズが5MB以下かどうか確認
  def image_size
    if image.attached? && image.byte_size > 5.megabytes
      errors.add(:image, 'must be less than 5MB')
    end
  end
end