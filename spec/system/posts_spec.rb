require 'rails_helper'

# RSpec.describe "新規投稿", type: :system do
#   before do
#     @post = FactoryBot.create(:post)
#   end

#   context '新規投稿できる場合' do
#     before do
#       @user = FactoryBot.create(:user)
#       # ログインページに移動する
#       visit login_path
#       # 情報を入力する
#       fill_in 'email', with: @user.email
#       fill_in 'password', with: @user.password
#       # ログインボタンを押せばログインでき投稿一覧ページに移動する
#       find('input[name="commit"]').click 
#       expect(current_path).to eq(posts_index_path)
#       # ログインしましたと表示される事を確認する
#       expect(page).to have_content('ログインしました')
#       # 新規投稿ページに移動できるボタンが存在する事を確認する
#       expect(page).to have_content('新規投稿')
#     end
#     it 'ログインしたユーザーが情報を正しく入力すれば新規投稿が出来て投稿一覧ページに移動する' do
#        # 新規投稿ページに移動する
#        visit new_post_path
#        # 情報を入力する
#        fill_in 'team_name', with: @post.team_name
#        find("#genre_id").find("option[value='2']").select_option        # fill_inはなぜか選択してくれないのでfindにしている
#        fill_in 'date', with: @post.date
#        fill_in 'content', with: @post.content
#        # 投稿ボタンを押せばPostモデルにレコードが１つ追加される事を確認する
#        expect{
#          find('input[name="commit"]').click
#        }.to change { Post.count }.by(1)
#        # 投稿一覧ページに移動する
#        expect(current_path).to eq(posts_index_path)
#        # 投稿を作成しました。画面をクリックすると消えますと表示される事を確認する
#        expect(page).to have_content('投稿を作成しました。画面をクリックすると消えます。')
#        # 投稿一覧ページに投稿内容が表示される事を確認する
#        expect(page).to have_content(@post_content)
#     end
#   end
#   context '新規投稿できない場合' do
#     before do
#       @user = FactoryBot.create(:user)
#       # ログインページに移動する
#       visit login_path
#       # 情報を入力する
#       fill_in 'email', with: @user.email
#       fill_in 'password', with: @user.password
#       # ログインボタンを押せばログインでき投稿一覧ページに移動する
#       find('input[name="commit"]').click 
#       expect(current_path).to eq(posts_index_path)
#       # ログインしましたと表示される事を確認する
#       expect(page).to have_content('ログインしました')
#       # 新規投稿ページに移動できるボタンが存在する事を確認する
#       expect(page).to have_content('新規投稿')
#     end
#     it '情報を正しく入力できなければ新規投稿が出来ず新規投稿ページに戻される' do
#       # 新規投稿ページに移動する
#       visit new_post_path
#       # 情報を入力する
#       fill_in 'team_name', with: ''
#       find("#genre_id").find("option[value='1']").select_option        # fill_inはなぜか選択してくれないのでfindにしている
#       fill_in 'date', with:''
#       fill_in 'content', with:''
#       # 投稿ボタンを押してもPostモデルのテーブルのカウントは増えない事を確認する
#       expect{
#         find('input[name="commit"]').click
#       }.to change{ Post.count }.by(0)
#       # 新規投稿ページに移動する事を確認する
#       expect(current_path).to eq("/posts/create")
#       # エラーメッセージが表示される事を確認する
#       expect(page).to have_content('詳細を入力してください')
#       expect(page).to have_content('チーム名を入力してください')
#       expect(page).to have_content('開催日時を入力してください')
#       expect(page).to have_content('開催地域を選択してください')
#     end
#   end
# end
# RSpec.describe "投稿編集", type: :system do
#   before do
#     @post1 = FactoryBot.create(:post, id: 1, content: 'test')
#     @post2 = FactoryBot.create(:post, id: 2, content: 'tteesstt')
#   end
#   context '投稿編集できるとき' do
#     it 'ログインしたユーザーは自分が投稿した投稿を編集できる' do
#       # post1 を投稿したユーザーでログインする
#       @user = FactoryBot.create(:user)
#       # ログインページに移動する
#       visit login_path
#       # 情報を入力する
#       fill_in 'email', with: @post1.user.email
#       fill_in 'password', with: @post1.user.password
#       # ログインボタンを押せばログインでき投稿一覧ページに移動する
#       find('input[name="commit"]').click 
#       expect(current_path).to eq(posts_index_path)
#       # ログインしましたと表示される事を確認する
#       expect(page).to have_content('ログインしました')
#       # post1の詳細ページに移動する
#       visit post_path(@post1)
#       # post1に編集ボタンがある事を確認する
#       expect(page).to have_content('編集')
#       # 編集ページに移動する
#       visit edit_post_path(@post1)
#       # 投稿済みの内容がフォームに入っていることを確認する
#       expect(
#         find('#team_name').value
#       ).to eq(@post1.team_name)
#       expect(
#         find('#content').value
#       ).to eq(@post1.content)
#       # 投稿内容を編集する
#       fill_in 'team_name', with: "#{@post1.team_name}+編集"
#       fill_in 'content', with: "#{@post1.content}+編集"
#       find("#genre_id").find("option[value='2']").select_option        # fill_inはなぜか選択してくれないのでfindにしている
#       fill_in 'date', with: @post1.date
#       # 編集してもPostモデルのレコードは増えない事を確認する
#       expect{
#         find('input[name="commit"]').click
#       }.to change { Post.count }.by(0)
#       # 投稿一覧画面に移動する事を確認する
#       expect(current_path).to eq(root_path)
#       # 内容を変更しました。画面をクリックすると消えます。と表示される事を確認する
#       expect(page).to have_content('内容を変更しました。画面をクリックすると消えます。')
#       # 先ほど変更した内容のツイートが存在することを確認する（テキスト）
#       expect(page).to have_content("#{@post1.content}+編集")
#     end
#   end
#   context '投稿編集できないとき' do
#     it 'ログインしたユーザーは自分の投稿ページ以外の編集画面に移動できない' do
#       # post1を投稿したユーザーでログインする
#         # ユーザー作成
#         @user = FactoryBot.create(:user)
#         # ログインページに移動する
#         visit login_path
#         # 情報を入力する
#         fill_in 'email', with: @post1.user.email
#         fill_in 'password', with: @post1.user.password
#         # ログインボタンを押せばログインでき投稿一覧ページに移動する
#         find('input[name="commit"]').click 
#         expect(current_path).to eq(posts_index_path)
#         # ログインしましたと表示される事を確認する
#         expect(page).to have_content('ログインしました')
#         # post1の詳細ページに移動する
#         visit post_path(@post2)
#         # post2に編集ボタンが存在しない事を確認する
#         expect(page).to have_no_content('編集')
#     end
#     it 'ログインしなければ投稿の編集画面に移動できない' do
#       # トップページに移動する
#       visit root_path
#       # post1への編集ページへ移動できずログインページに移動する
#       click_on("test")
#       expect(current_path).to eq('/login')
#       # ログインが必要ですが表示される事を確認する
#       expect(page).to have_content('ログインが必要です')
#     end
#     it 'ログインしたユーザーの編集内容に空欄がある時は投稿を編集できず投稿編集ページに戻される' do
#       # post1 を投稿したユーザーでログインする 
#         # ユーザー作成
#         @user = FactoryBot.create(:user)
#         # ログインページに移動する
#         visit login_path
#         # 情報を入力する
#         fill_in 'email', with: @post1.user.email
#         fill_in 'password', with: @post1.user.password
#         # ログインボタンを押せばログインでき投稿一覧ページに移動する
#         find('input[name="commit"]').click 
#         expect(current_path).to eq(posts_index_path)
#         # ログインしましたと表示される事を確認する
#         expect(page).to have_content('ログインしました')
#       # post1の詳細ページに移動する
#       visit post_path(@post1)
#       # post1に編集へのボタンがある事を確認する
#       expect(page).to have_content('編集')
#       # 編集ページに移動する
#       visit edit_post_path(@post1)
#       # 投稿済みの内容がフォームに入っていることを確認する
#       expect(
#         find('#team_name').value
#       ).to eq(@post1.team_name)
#       expect(
#         find('#content').value
#       ).to eq(@post1.content)
#       # 投稿内容を編集する
#       fill_in 'team_name', with: ''
#       fill_in 'content', with: ''
#       find("#genre_id").find("option[value='1']").select_option        # fill_inはなぜか選択してくれないのでfindにしている
#       fill_in 'date', with: ''
#       # 編集ボタンを押してもPostモデルのテーブルは編集できない事を確認する
#       expect{
#         find('input[name="commit"]').click
#       }.to change { Post.count }.by(0)
#       # 投稿編集ページに移動する事を確認する
#       expect(current_path).to eq("/posts/#{@post1.id}/update/")
#       # エラーメッセージが表示される事を確認する
#       expect(page).to have_content('詳細を入力してください')
#       expect(page).to have_content('チーム名を入力してください')
#       expect(page).to have_content('開催日時を入力してください')
#       expect(page).to have_content('開催地域を選択してください')
#     end
#   end
# end
RSpec.describe "投稿削除", type: :system do
  before do
    @post1 = FactoryBot.create(:post, id: 1, content: 'test')
    @post2 = FactoryBot.create(:post, id: 2, content: 'tteesstt')
  end
  context '投稿削除ができるとき' do
    it 'ログインしたユーザーは自分の投稿の削除ができる' do
      # post1で投稿したユーザーでログインする
        # ユーザー作成
        @user = FactoryBot.create(:user)
        # ログインページに移動する
        visit login_path
        # 情報を入力する
        fill_in 'email', with: @post1.user.email
        fill_in 'password', with: @post1.user.password
        # ログインボタンを押せばログインでき投稿一覧ページに移動する
        find('input[name="commit"]').click 
        expect(current_path).to eq(posts_index_path)
        # ログインしましたと表示される事を確認する
        expect(page).to have_content('ログインしました')
      # 詳細ページに移動する
      visit post_path(@post1)
      # 詳細ページに削除ボタンが存在する事を確認する
      expect(page).to have_content('削除')
      # 削除ボタンを押すとPostモデルのレコードが1減る事を確認する
      expect{
        find_link('削除', href: "/posts/#{@post1.id}/destroy/").click
      }.to change { Post.count }.by(-1)
      # 投稿一覧ページに移動する事を確認する
      expect(current_path).to eq('/')
      # 投稿を削除しました。画面をクリックすると消えます。と表示される事を確認する
      expect(page).to have_content('投稿を削除しました。画面をクリックすると消えます。')
      # 投稿一覧ページにpost1の投稿が存在しない事を確認する
      expect(page).to have_no_content("#{@post1.content}")
    end
  end
  context '投稿削除ができないとき' do
    it 'ログインしたユーザーは自分の投稿以外の削除ができない' do
      # post1で投稿したユーザーでログインする
        # ユーザー作成
        @user = FactoryBot.create(:user)
        # ログインページに移動する
        visit login_path
        # 情報を入力する
        fill_in 'email', with: @post1.user.email
        fill_in 'password', with: @post1.user.password
        # ログインボタンを押せばログインでき投稿一覧ページに移動する
        find('input[name="commit"]').click 
        expect(current_path).to eq(posts_index_path)
        # ログインしましたと表示される事を確認する
        expect(page).to have_content('ログインしました')
      # post2の詳細ページに移動する
      visit post_path(@post2)
      # 詳細ページに削除ボタンが存在しない事を確認する
      expect(page).to have_no_content('削除')
    end
  end
end
RSpec.describe "投稿詳細", type: :system do
  before do
    @post = FactoryBot.create(:post, content: 'test')
  end
  context '投稿詳細ページを表示できる場合' do
    it 'ログインしたユーザーは投稿詳細ページに移動してコメント投稿欄が表示される' do
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
      # 投稿内容をクリックして投稿詳細ページに移動する
      click_on("test")
      expect(current_path).to eq post_path(@post)
      # 詳細ページに投稿内容が存在する
      expect(page).to have_content("#{@post.team_name}")
      expect(page).to have_content("#{@post.genre_id}")
      expect(page).to have_content("#{@post.date}")
      expect(page).to have_content("#{@post.content}")
      expect(page).to have_content("#{@post.created_at}")
      # コメントフォームが存在する
      expect(page).to have_selector 'form'
    end
  end
  context '投稿詳細ページを表示できない場合' do
    it 'ログインしなければ投稿詳細ページに移動できずにログインページに移動する' do
      # トップページに移動する
      visit root_path
      # 投稿詳細ページに移動できずログインページに移動する
      click_on("test")
      expect(current_path).to eq('/login')
      # ログインが必要ですが表示される事を確認する
      expect(page).to have_content('ログインが必要です')
    end
  end
end