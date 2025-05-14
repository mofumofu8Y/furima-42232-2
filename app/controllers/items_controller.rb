class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :set_select_box_values, only: [:new, :create, :edit, :update]

  def index
    @items = Item.includes(:image_attachment).order(created_at: :desc)
  end

  def show
    # @item は before_action で取得済み
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: '商品を出品しました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    unless current_user == @item.user
      redirect_to root_path, alert: 'この商品は編集できません'
    end
  end

  def update
    unless current_user == @item.user
      redirect_to root_path, alert: 'この商品は編集できません'
      return
    end

    if @item.update(item_params)
      redirect_to item_path(@item), notice: '商品情報を更新しました'
    else
      render :edit, status: :unprocessable_entity
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

  def set_item
    @item = Item.find(params[:id])
  end

  def redirect_if_not_owner
    redirect_to root_path unless current_user == @item.user
  end

  def set_select_box_values
    @categories = Category.all
    @conditions = Condition.all
    @shipping_fees = ShippingFee.all
    @prefectures = Prefecture.all
    @scheduled_deliveries = ScheduledDelivery.all
    @days_to_ship = DaysToShip.all
  end
end