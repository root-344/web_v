require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.create(:post)
  end
  
  describe '新規投稿' do
    context '新規投稿できる時' do
      it '情報を正しく入力できれば投稿できる' do
        expect(@post).to be_valid
      end
    end
    context '新規投稿できない時' do
      it 'team_nameが空では登録できない' do
        @post.team_name = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("チーム名を入力してください")
      end
      it '詳細が空では登録できない' do
        @post.content = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("詳細を入力してください")
      end
      it '開催地域が空では登録できない' do
        @post.genre_id = 1
        @post.valid?
        expect(@post.errors.full_messages).to include("開催地域を選択してください")
      end
      it '開催日時が空では登録できない' do
        @post.date = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("開催日時を入力してください")
      end
    end
  end

end
