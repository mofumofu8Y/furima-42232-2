class RemoveStatusIdFromItems < ActiveRecord::Migration[7.1]
  def change
    remove_column :items, :status_id, :integer
  end
end
