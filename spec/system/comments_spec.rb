require 'rails_helper'

RSpec.describe "コメント", type: :system do
  before do
    @post = FactoryBot.create(:post)
    @comment = Faker::Lorem.sentence
  end
  context 'コメントできる場合' do
    it 'ログインしたユーザーは投稿詳細ページでコメントできる' do
      # ログインする
        # ユーザー作成
        @user = FactoryBot.create(:user)
        # ログインページに移動する
        visit login_path
        # 情報を入力する
        fill_in 'email', with: @post.user.email
        fill_in 'password', with: @post.user.password
        # ログインボタンを押せばログインでき投稿一覧ページに移動する
        find('input[name="commit"]').click 
        expect(current_path).to eq(posts_index_path)
        # ログインしましたと表示される事を確認する
        expect(page).to have_content('ログインしました')      
      # 詳細ページに移動する
      visit post_path(@post)
      # コメントフォームに情報を入力する
      fill_in 'comment[text]', with: @comment
      # SENDを押すとCommentモデルのレコードが1増える
      expect{
        find('input[name="commit"]').click
      }.to change { Comment.count }.by(1)
      # 詳細ページにコメント内容が存在する事を確認する
      expect(page).to have_content @comment
    end
  end
  context 'コメントできない場合' do
    it 'ログインしたユーザーが投稿詳細ページでコメントフォームにコメントを入力しないときコメントはできない' do
      # ログインする
        # ユーザー作成
        @user = FactoryBot.create(:user)
        # ログインページに移動する
        visit login_path
        # 情報を入力する
        fill_in 'email', with: @post.user.email
        fill_in 'password', with: @post.user.password
        # ログインボタンを押せばログインでき投稿一覧ページに移動する
        find('input[name="commit"]').click 
        expect(current_path).to eq(posts_index_path)
        # ログインしましたと表示される事を確認する
        expect(page).to have_content('ログインしました')      
      # 投稿詳細ページに移動する
      visit post_path(@post)
      # コメントフォームに情報を入力しない
      fill_in 'comment[text]', with: ""
      # SENDを押してもCommentモデルのレコードは増えない
      expect{
        find('input[name="commit"]').click
      }.to change { Comment.count }.by(0)
      # 詳細ページにコメント内容が存在しない事を確認する
      expect(page).to have_no_content @comment
    end
  end
end
