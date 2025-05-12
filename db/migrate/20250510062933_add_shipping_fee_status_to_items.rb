class AddShippingFeeStatusToItems < ActiveRecord::Migration[7.1]
  def change
    # 条件なしで確実に追加する
    add_column :items, :shipping_fee_id, :integer, null: false
  end
end