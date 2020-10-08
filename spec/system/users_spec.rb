require 'rails_helper'

RSpec.describe 'ユーザー新規登録', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  context 'ユーザー新規登録ができるとき' do
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      visit root_path
      expect(page).to have_content('新規登録')
      expect(page).to have_content('ログイン')
      visit new_user_registration_path
      fill_in 'nickname', with: @user.nickname
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      fill_in 'password-confirmation', with: @user.password_confirmation
      fill_in 'first-name', with: @user.name_first
      fill_in 'last-name', with: @user.name_last
      fill_in 'first-name-kana', with: @user.name_first_kana
      fill_in 'last-name-kana', with: @user.name_last_kana
      find('#user_birth_day_1i').find("option[value='1930']").select_option
      find('#user_birth_day_2i').find("option[value='1']").select_option
      find('#user_birth_day_3i').find("option[value='1']").select_option
      expect do
        find('input[name="commit"]').click
      end.to change { User.count }.by(1)
      expect(current_path).to eq root_path
      expect(page).to have_content('ログアウト')
      expect(page).to have_no_content('@user.nickname')
    end
  end
  context 'ユーザー新規登録ができないとき' do
    it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
      visit root_path
      expect(page).to have_content('新規登録')
      expect(page).to have_content('ログイン')
      visit new_user_registration_path
      fill_in 'nickname', with: ''
      fill_in 'email', with: ''
      fill_in 'password', with: ''
      fill_in 'password-confirmation', with: ''
      fill_in 'first-name', with: ''
      fill_in 'last-name', with: ''
      fill_in 'first-name-kana', with: ''
      fill_in 'last-name-kana', with: ''
      expect  do
        find('input[name="commit"]').click
      end.to change { User.count }.by(0)
      expect(current_path).to eq '/users'
    end
  end
end
RSpec.describe 'ログイン、ログアウト機能の確認', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end
  context 'ログイン' do
    it 'ログインボタンをクリックすることでログインができること' do
      visit root_path
      expect(page).to have_content('ログイン')
      visit new_user_session_path
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      expect(page).to have_content('ログアウト')
      expect(page).to have_no_content('@user.nickname')
    end
  end
  context 'ログアウト' do
    it 'ログアウトボタンをクリックすることでログアウトができること' do
      visit root_path
      visit new_user_session_path
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      find('input[name="commit"]').click
      click_on('ログアウト')
      expect(current_path).to eq root_path
      expect(page).to have_content('新規登録')
      expect(page).to have_content('ログイン')
    end
  end
end
