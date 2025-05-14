# class OrdersController < ApplicationController
#   before_action :set_item

#   # 商品購入ページ
#   def new
#     @order = Order.new
#   end

#   # 注文作成
#   def create
#     @order = @item.orders.build(order_params)
#     @order.user = current_user  # 現在ログインしているユーザーを注文者として設定

#     if @order.save
#       redirect_to item_path(@item), notice: '注文が完了しました！'
#     else
#       render :new
#     end
#   end

#   private

#   def set_item
#     @item = Item.find(params[:item_id])
#   end

#   def order_params
#     params.require(:order).permit(:address, :payment_method)  # 必要なパラメータを追加
#   end
# end