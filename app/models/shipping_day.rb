class ShippingDay < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '1~2日で発送' },
    { id: 3, name: '3~4日で発送' },
    { id: 4, name: '5~6日で発送' }
  ]

  include ActiveHash::Associations
  has_many :items
end