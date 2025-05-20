# spec/models/order_form_spec.rb
require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  describe '購入情報の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order_form = OrderForm.new(
        postal_code: '123-4567',
        prefecture_id: 2,
        city: '渋谷区',
        address: '1-1-1',
        building_name: 'テストビル',
        phone_number: '09012345678',
        token: 'tok_abcdefghijk00000000000000000',
        user_id: @user.id,
        item_id: @item.id
      )
    end

    context '内容に問題がない場合' do
      it '全ての値が正しく入力されていれば保存できる' do
        expect(@order_form).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号が空では保存できない' do
        @order_form.postal_code = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'トークンが空では保存できない' do
        @order_form.token = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end

      it 'user_idが空では保存できない' do
        @order_form.user_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空では保存できない' do
        @order_form.item_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end