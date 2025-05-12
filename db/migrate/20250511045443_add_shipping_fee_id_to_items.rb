class AddShippingFeeIdToItems < ActiveRecord::Migration[7.1]
  def change
    add_column :items, :shipping_fee_id, :integer
  end
end
