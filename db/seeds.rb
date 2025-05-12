# db/seeds.rb

# 商品の状態（Condition）
Condition.create!([
  { name: '新品・未使用' },
  { name: '未使用に近い' },
  { name: '目立った傷や汚れなし' },
  { name: 'やや傷や汚れあり' },
  { name: '傷や汚れあり' },
  { name: '全体的に状態が悪い' }
])

# 配送料の負担（ShippingFee）
ShippingFee.create!([
  { name: '送料込み（出品者負担）' },
  { name: '着払い（購入者負担）' }
])