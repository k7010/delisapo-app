require 'rails_helper'

RSpec.describe "持出登録", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @baggage = FactoryBot.build(:baggage)
  end

  context '持出登録ができるとき' do
    it 'ログインしたユーザーは持出登録できる' do
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)

      expect(page).to have_content('持 出 登 録')
      visit new_baggage_path
      fill_in 'baggage[address]', with: @baggage.address
      fill_in 'baggage[block]', with: @baggage.block
      fill_in 'baggage[building]', with: @baggage.building
      fill_in 'baggage[family_name]', with: @baggage.family_name
      fill_in 'baggage[first_name]', with: @baggage.first_name
      choose 'baggage[time_specification]', with: @baggage.time_specification
      expect{
        find('input[name="commit"]').click
      }.to change { Baggage.count }.by(1)

      expect(current_path).to eq(root_path)
      visit root_path
      expect(page).to have_content(@baggage.address)
      expect(page).to have_content(@baggage.block)
      expect(page).to have_content(@baggage.building)
      expect(page).to have_content(@baggage.family_name)
      expect(page).to have_content(@baggage.first_name)
      expect(page).to have_content(@baggage.time_specification)
    end
  end
  context '持出登録ができないとき' do
    it 'ログインしていないと持出登録できない' do
      visit root_path
      expect(page).to have_content('持 出 登 録')
      visit new_baggage_path
      expect(page).to have_no_content('登録')
    end
  end

end

RSpec.describe '持出荷物削除', type: :system do
  before do
    @baggage1 = FactoryBot.create(:baggage)
    @baggage2 = FactoryBot.create(:baggage)
  end
  context '持出荷物の削除ができる' do
    it 'ログインユーザーは自ら登録した持出荷物を削除できる' do
      visit new_user_session_path
      fill_in 'Email', with: @baggage1.user.email
      fill_in 'Password', with: @baggage1.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)

      visit baggage_path(@baggage1.id)
      expect(
        all('.baggage-destroy')[0].hover
      ).to have_link '持出データ削除', href: baggage_path(@baggage1)
      expect{
        all('.baggage-destroy')[0].hover.find_link('持出データ削除', href: baggage_path(@baggage1)).click
      }.to change { Baggage.count }.by(-1)
      expect(current_path).to eq(root_path)
      expect(page).to have_no_content(@baggage1)
      #expect(page).to have_content('持出データ削除')
    end
  end
  context '持出荷物の削除ができない' do
    it '自分以外のユーザーが登録した持出荷物は削除できない' do
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
