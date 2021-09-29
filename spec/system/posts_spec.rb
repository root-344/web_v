require 'rails_helper'

RSpec.describe "Posts", type: :system do
  before do
    @post = FactoryBot.create(:post)
  end

  context '新規投稿できる場合' do
    before do
      @user = FactoryBot.create(:user, :user_with_posts)
      allow_any_instance_of(ActionDispatch::Request).to receive(:session).and_return({ user_id: @user.id })
    end
    it 'ログインしたユーザーが情報を正しく入力すれば新規投稿が出来て投稿一覧ページに移動する' do
       # ログインページに移動する
       visit login_path
       # 情報を入力する
       fill_in 'email', with: @user.email
       fill_in 'password', with: @user.password
       # ログインボタンを押せばログインでき投稿一覧ページに移動する
       find('input[name="commit"]').click 
       expect(current_path).to eq(posts_index_path)
       binding.pry
       # ログインしましたと表示される事を確認する
       # 新規投稿ページに移動できるボタンが存在する事を確認する
       # 新規投稿ページに移動する
       # 情報を入力する
       # 投稿ボタンを押せばPostモデルにレコードが１つ追加される事を確認する
       # 投稿一覧ページに移動する
       # 投稿しましたと表示される事を確認する
       # 投稿一覧ページに投稿内容が表示される事を確認する

    end
  end
  context '新規投稿できない場合' do
    it '情報を正しく入力できなければ新規投稿が出来ず新規投稿ページに戻される' do
      
    end
  end

end
