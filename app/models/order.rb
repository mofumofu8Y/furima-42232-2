 class Order < ApplicationRecord
   belongs_to :item
   belongs_to :user
   has_one :shipping_address

#   validates :address, presence: true
#   validates :payment_method, presence: true
 end