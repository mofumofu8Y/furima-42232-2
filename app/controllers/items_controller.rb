class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.includes(:image_attachment).order(created_at: :desc)
  end

  def new
    @item = Item.new
    @categories = Category.all
    @conditions = Condition.all
    @shipping_fees = ShippingFee.all
    @prefectures = Prefecture.all
    @scheduled_deliveries = ScheduledDelivery.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: '商品を出品しました'
    else
      # エラー発生時もセレクトボックスを再表示できるように各ActiveHashモデルを再読み込み
      @categories = Category.all
      @conditions = Condition.all
      @shipping_fees = ShippingFee.all
      @prefectures = Prefecture.all
      @scheduled_deliveries = ScheduledDelivery.all
      render :new, status: :unprocessable_entity

    end
  end

  private

def item_params
  params.require(:item).permit(
    :name,
    :description,
    :category_id,
    :condition_id,
    :shipping_fee_id,  
    :prefecture_id,
    :scheduled_delivery_id,
    :price,
    :image
  ).merge(user_id: current_user.id)
end
end