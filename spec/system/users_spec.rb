require 'rails_helper'

RSpec.describe "新規登録", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  context '新規登録ができるとき' do
    it '正しい情報を入力すれば新規登録ができトップページに移動する' do
      # トップページに移動する
      visit root_path
      # トップページに新規登録ボタンがある事を確認する
      expect(page).to have_content('新規登録')
      # 新規登録ボタンを押せば新規登録ページに移動する
      visit signup_path
      # 情報を入力する
      fill_in 'first_name', with: @user.first_name
      fill_in 'last_name', with: @user.last_name
      fill_in 'first_name_kana', with: @user.first_name_kana
      fill_in 'last_name_kana', with: @user.last_name_kana
      fill_in 'nickname', with: @user.nickname
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      # 新規登録ボタンを押すとUserモデルのレコードが１増える事を確認する
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(1)
      # トップページに移動した事を確認する
      expect(current_path).to eq(posts_index_path)
      # ログアウトボタンが表示される事を確認する
      expect(page).to have_content('ログアウト')
      # 新規登録ボタンやログインボタンが表示されない事を確認する
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
    end
  end
  # context '新規登録できないとき' do
    
  # end
end
