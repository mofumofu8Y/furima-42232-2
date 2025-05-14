class CreateDaysToShips < ActiveRecord::Migration[7.1]
  def change
    create_table :days_to_ships do |t|
      t.string :name

      t.timestamps
    end
  end
end
