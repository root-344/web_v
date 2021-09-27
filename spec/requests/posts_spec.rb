require 'rails_helper'

RSpec.describe PostsController, type: :request do
  before do
    @post = FactoryBot.create(:post)
  end
    
    
  describe 'GET #index' do
    it 'indexアクションにリクエストすると正常にレスポンスが返ってくる' do
      get root_path
      expect(response.status).to eq 200
    end
    it 'indexアクションにリクエストするとレスポンスに投稿済みのテキストが存在する' do
      get root_path
      expect(response.body).to include(@post.content)
    end
  end
  describe 'Get #show' do
    before do
      @user = FactoryBot.create(:user, :user_with_posts)
      allow_any_instance_of(ActionDispatch::Request).to receive(:session).and_return({ user_id: @user.id })
    end
    it 'showアクションにリクエストすると正常にレスポンスが返ってくる' do
      get post_path(@post)
      expect(response.status).to eq 200
    end
    it 'showアクションにリクエストするとレスポンスに投稿済みのテキストが存在する' do
      get post_path(@post)
      expect(response.body).to include(@post.content)
    end
    it 'showアクションにリクエストするとレスポンスにコメント一覧表示部分が存在する' do
      get post_path(@post)
      expect(response.body).to include("＜コメント一覧＞")
    end

  end
end
