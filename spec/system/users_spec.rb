require 'rails_helper'

RSpec.describe 'ユーザー新規登録', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  context 'ユーザー新規登録ができるとき' do
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      visit root_path
      expect(page).to have_content('Sign Up')
      visit new_user_registration_path
      fill_in 'user[staff_number]', with: @user.staff_number
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      fill_in 'user[password_confirmation]', with: @user.password_confirmation
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(1)
      expect(current_path).to eq(root_path)
      expect(page).to have_content('Logout')
      expect(page).to have_no_content('Sign Up')
      expect(page).to have_no_content('Sign In')
    end
  end
  context 'ユーザー新規登録ができないとき' do
    it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
      visit root_path
      expect(page).to have_content('Sign Up')
      visit new_user_registration_path
      fill_in 'user[staff_number]', with: ''
      fill_in 'Email', with: ''
      fill_in 'Password', with: ''
      fill_in 'user[password_confirmation]', with: ''
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(0)
      expect(current_path).to eq user_registration_path
    end
  end
end


RSpec.describe "ログイン", type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  context 'ログインできるとき' do
    it '保存されているユーザーの情報と合致すればログインができる' do
      visit root_path
      expect(page).to have_content('Sign In')
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      expect(page).to have_content('Logout')
      expect(page).to have_no_content('Sign Up')
      expect(page).to have_no_content('Sign In')
    end
  end
  context 'ログインできないとき' do
    it '保存されているユーザーの情報と合致しないとログインができない' do
      visit root_path
      expect(page).to have_content('Sign In')
      visit new_user_session_path
      fill_in 'Email', with: ''
      fill_in 'Password', with: ''
      find('input[name="commit"]').click
      expect(current_path).to eq(new_user_session_path)
    end
  end

end
