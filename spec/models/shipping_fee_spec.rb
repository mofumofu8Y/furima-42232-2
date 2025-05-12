# spec/models/shipping_fee_status_spec.rb

require 'rails_helper'

RSpec.describe ShippingFeeStatus, type: :model do
  it '正常にデータが取得できること' do
    # ShippingFeeStatusのデータが取得できることを確認
    expect(ShippingFeeStatus.all).to be_present
  end
end