class ItemsController < ApplicationController
  def index
    # 必要に応じてモデルからデータを取得してビューに渡す
    @items = Item.all  # 例えば全ての商品を取得
  end
end
