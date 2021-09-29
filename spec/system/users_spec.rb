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
      # 投稿一覧ページに移動した事を確認する
      expect(current_path).to eq(posts_index_path)
      # ログアウトボタンが表示される事を確認する
      expect(page).to have_content('ログアウト')
      # 新規登録ボタンやログインボタンが表示されない事を確認する
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
    end
  end
   context '新規登録できないとき' do
     it '正しい情報を入力できなければ新規登録できずに新規登録ページに戻される' do
      # トップページに移動する
      visit root_path
      # トップページに新規登録ページに移動するボタンがあるか確認する
      expect(page).to have_content('新規登録')
      # 新規登録ページに移動する
      visit signup_path
      # 情報を入力する 
      fill_in 'first_name', with: ''
      fill_in 'last_name', with: ''
      fill_in 'first_name_kana', with: ''
      fill_in 'last_name_kana', with: ''
      fill_in 'nickname', with: ''
      fill_in 'email', with: ''
      fill_in 'password', with: ''
      # 新規登録ボタンを押してUserモデルのレコードが増えない事を確認する
      expect{
        find('input[name="commit"]').click
      }.to change {User.count}.by(0)
      # 新規登録ページに移動する事を確認する
      expect(current_path).to eq('/users/create')
      # エラーメッセージが表示される事を確認する
      expect(page).to have_content('名前(姓)を入力してください')
      expect(page).to have_content('名前(姓)は漢字で入力してください')
      expect(page).to have_content('名前(名)を入力してください')
      expect(page).to have_content('名前(名)は漢字で入力してください')
      expect(page).to have_content('姓(カナ)を入力してください')
      expect(page).to have_content('姓(カナ)はカタカナで入力してください')
      expect(page).to have_content('名(カナ)を入力してください')
      expect(page).to have_content('名(カナ)はカタカナで入力してください')
      expect(page).to have_content('ニックネームを入力してください')
      expect(page).to have_content('メールアドレスを入力してください')
      expect(page).to have_content('パスワードを入力してください')
      expect(page).to have_content('パスワードは8文字以上で入力してください')
      expect(page).to have_content('パスワードは英数字で入力してください')
     end
   end
end
