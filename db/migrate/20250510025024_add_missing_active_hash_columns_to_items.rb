class AddMissingActiveHashColumnsToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :status_id, :integer, null: false
    add_column :items, :shipping_day_id, :integer, null: false
  end
end