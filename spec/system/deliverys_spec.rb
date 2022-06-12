require 'rails_helper'

RSpec.describe "配達実績の登録", type: :system do
  before do
    @baggage1 = FactoryBot.create(:baggage)
    @baggage2 = FactoryBot.create(:baggage)
    @delivery = FactoryBot.create(:delivery)
  end
  context '配達実績を登録できる' do
    it 'ログインユーザーは自ら登録した持出荷物の配達実績を配達完了で登録できる' do
      visit new_user_session_path
      fill_in 'Email', with: @baggage1.user.email
      fill_in 'Password', with: @baggage1.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)

      visit baggage_path(@baggage1.id)
      choose 'delivery[delivery_result]', with: @delivery.delivery_result
      expect{
        find('input[name="commit"]').click
      }.to change { Delivery.count }.by(1)

      expect(current_path).to eq(root_path)
      visit root_path
      expect(page).to have_content '完了'

      visit baggage_path(@baggage1.id)
      expect(page).to have_content '配達済み'
    end
    it 'ログインユーザーは自ら登録した持出荷物の配達実績を不在で登録できる' do
      visit new_user_session_path
      fill_in 'Email', with: @baggage1.user.email
      fill_in 'Password', with: @baggage1.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)

      visit baggage_path(@baggage1.id)
      choose '不在'
      expect{
        find('input[name="commit"]').click
      }.to change { Delivery.count }.by(1)
      expect(current_path).to eq(root_path)
      visit root_path
      expect(page).to have_no_content '完了'

      visit baggage_path(@baggage1.id)
      expect(page).to have_no_content '配達済み'
    end
  end
  context '配達実績を登録できない' do
    it 'ログインしていないと配達実績を登録できない' do
      visit root_path
      expect(page).to have_css '.not-logged'
    end
    it '自分以外のユーザーが登録した持出荷物は配達実績を登録できない' do
      visit new_user_session_path
      fill_in 'Email', with: @baggage1.user.email
      fill_in 'Password', with: @baggage1.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)

      visit baggage_path(@baggage2.id)
      expect(current_path).to eq(root_path)
    end
  end

  
end
