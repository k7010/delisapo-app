require 'rails_helper'

RSpec.describe Baggage, type: :model do
  before do
    @baggage = FactoryBot.build(:baggage)
  end

  describe '荷物情報登録' do
    context '荷物情報を登録できるとき' do
      it '入力項目を全て正しく入力している場合' do
        expect(@baggage).to be_valid
      end
      it 'buildingが空欄でも登録できる' do
        @baggage.building = ''
        expect(@baggage).to be_valid
      end
    end
    context '荷物情報を登録できないとき' do
      it 'addressが空欄だと登録できない' do
        @baggage.address = ''
        @baggage.valid?
        expect(@baggage.errors.full_messages).to include("Address can't be blank")
      end
      it 'blockが空欄だと登録できない' do
        @baggage.block = ''
        @baggage.valid?
        expect(@baggage.errors.full_messages).to include("Block can't be blank")
      end
      it 'family_nameが空欄だと登録できない' do
        @baggage.family_name = ''
        @baggage.valid?
        expect(@baggage.errors.full_messages).to include("Family name can't be blank")
      end
      it 'first_nameが空欄だと登録できない' do
        @baggage.first_name = ''
        @baggage.valid?
        expect(@baggage.errors.full_messages).to include("First name can't be blank")
      end
      it 'time_specificationが空欄だと登録できない' do
        @baggage.time_specification = ''
        @baggage.valid?
        expect(@baggage.errors.full_messages).to include("Time specification can't be blank")
      end
    end
  end
end
