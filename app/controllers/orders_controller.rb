class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :redirect_if_seller, only: [:index, :create]
  before_action :redirect_if_ordered, only: [:index, :create]

  def index
    @order_form = OrderForm.new

  end

  def create
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      pay_item
      @order_form.save
      redirect_to root_path
    else      
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_form).permit(
      :postal_code, :prefecture_id, :city, :address, :building,
      :phone_number
    ).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def set_item
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @item = Item.find(params[:item_id])
  end

  def redirect_if_ordered
    if @item.order.present?
      redirect_to root_path
    end
  end

  # 🚫 出品者 or 売却済み商品の場合はトップページにリダイレクト
  def redirect_if_seller
    if current_user == @item.user
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key =  ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end