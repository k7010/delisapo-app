require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できないとき' do
      it 'staff_numberが空では登録できない' do
        @user.staff_number = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Staff number can't be blank")
      end
      it 'staff_numberが重複したら登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.staff_number = @user.staff_number
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Staff number has already been taken")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailが重複したら登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'passwoedが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '1234'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end
