require 'rails_helper'

RSpec.describe Delivery, type: :model do
  before do
    @delivery = FactoryBot.build(:delivery)
  end

  describe '配達実績登録' do
    context '配達実績を登録できるとき' do
      it '入力項目を正しく入力している場合' do
        expect(@delivery).to be_valid
      end
    end
    context '配達実績を登録できない' do
      it 'delivery_resultが空欄の場合' do
        @delivery.delivery_result = ''
        @delivery.valid?
        expect(@delivery.errors.full_messages).to include("Delivery result can't be blank")
      end
    end
  end
end
