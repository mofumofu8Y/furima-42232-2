class RemoveShippingFeeStatusIdFromItems < ActiveRecord::Migration[7.1]
  def change
    remove_column :items, :shipping_fee_status_id, :integer
  end
end
