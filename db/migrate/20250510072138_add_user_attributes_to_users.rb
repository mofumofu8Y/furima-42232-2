class AddUserAttributesToUsers < ActiveRecord::Migration[7.1]
  def change
    # nickname, last_name, first_name などはすでに存在しているので追加しない
    add_column :users, :password, :string # 必要なカラムだけ追加
  end
end