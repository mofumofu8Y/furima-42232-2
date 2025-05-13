class AddDeliveryDayToItems < ActiveRecord::Migration[7.1]
  def change
    add_column :items, :delivery_day_id, :integer
  end
end
