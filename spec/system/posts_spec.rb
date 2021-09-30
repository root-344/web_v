require 'rails_helper'

RSpec.describe "Posts", type: :system do
  before do
    @post = FactoryBot.create(:post)
  end

  context '新規投稿できる場合' do
    before do
      @user = FactoryBot.create(:user)
      # ログインページに移動する
      visit login_path
      # 情報を入力する
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      # ログインボタンを押せばログインでき投稿一覧ページに移動する
      find('input[name="commit"]').click 
      expect(current_path).to eq(posts_index_path)
      # ログインしましたと表示される事を確認する
      expect(page).to have_content('ログインしました')
      # 新規投稿ページに移動できるボタンが存在する事を確認する
      expect(page).to have_content('新規投稿')
    end
    it 'ログインしたユーザーが情報を正しく入力すれば新規投稿が出来て投稿一覧ページに移動する' do
       # 新規投稿ページに移動する
       visit new_post_path
       # 情報を入力する
       fill_in 'team_name', with: @post.team_name
       find("#genre_id").find("option[value='2']").select_option        # fill_inはなぜか選択してくれないのでfindにしている
       fill_in 'date', with: @post.date
       fill_in 'content', with: @post.content
       # 投稿ボタンを押せばPostモデルにレコードが１つ追加される事を確認する
       expect{
         find('input[name="commit"]').click
       }.to change { Post.count }.by(1)
       # 投稿一覧ページに移動する
       expect(current_path).to eq(posts_index_path)
       # 投稿を作成しました。画面をクリックすると消えますと表示される事を確認する
       expect(page).to have_content('投稿を作成しました。画面をクリックすると消えます。')
       # 投稿一覧ページに投稿内容が表示される事を確認する
       expect(page).to have_content(@post_content)
    end
  end
  context '新規投稿できない場合' do
    before do
      @user = FactoryBot.create(:user)
      # ログインページに移動する
      visit login_path
      # 情報を入力する
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      # ログインボタンを押せばログインでき投稿一覧ページに移動する
      find('input[name="commit"]').click 
      expect(current_path).to eq(posts_index_path)
      # ログインしましたと表示される事を確認する
      expect(page).to have_content('ログインしました')
      # 新規投稿ページに移動できるボタンが存在する事を確認する
      expect(page).to have_content('新規投稿')
    end
    it '情報を正しく入力できなければ新規投稿が出来ず新規投稿ページに戻される' do
      # 新規投稿ページに移動する
      visit new_post_path
      # 情報を入力する
      fill_in 'team_name', with: ''
      find("#genre_id").find("option[value='1']").select_option        # fill_inはなぜか選択してくれないのでfindにしている
      fill_in 'date', with:''
      fill_in 'content', with:''
      # 投稿ボタンを押してもPostモデルのテーブルのカウントは増えない事を確認する
      expect{
        find('input[name="commit"]').click
      }.to change{ Post.count }.by(0)
      # 新規投稿ページに移動する事を確認する
      expect(current_path).to eq("/posts/create")
      # エラーメッセージが表示される事を確認する
      expect(page).to have_content('詳細を入力してください')
      expect(page).to have_content('チーム名を入力してください')
      expect(page).to have_content('開催日時を入力してください')
      expect(page).to have_content('開催地域を選択してください')
    end
  end

end
