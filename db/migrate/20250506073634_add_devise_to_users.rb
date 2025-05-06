class AddDeviseToUsers < ActiveRecord::Migration[7.0]
  def change
    change_table :users, bulk: true do |t|
      # reset_password_token カラムが存在しない場合、追加する
      t.string :reset_password_token unless column_exists?(:users, :reset_password_token)

      # reset_password_token インデックスを追加（重複しないように確認）
      t.index :reset_password_token, unique: true unless index_exists?(:users, :reset_password_token)
    end
  end
end