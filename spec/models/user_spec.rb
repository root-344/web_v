require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  # 一応exceptは残しています。
  describe '新規登録' do
    context '登録できる時' do
      it '情報が正しく入力されていれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '登録できない時' do
      it 'first_nameが空では登録できない' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("名前(姓)を入力してください", "名前(姓)は漢字で入力してください")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("名前(名)を入力してください", "名前(名)は漢字で入力してください")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("姓(カナ)を入力してください", "姓(カナ)はカタカナで入力してください")
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("名(カナ)を入力してください", "名(カナ)はカタカナで入力してください")
      end
      it 'nicknameが空では登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'emailが空では登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレスを入力してください")
      end
      it 'passwordが空では登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'first_nameが10文字より多い場合、登録できない' do
        @user.first_name = 'aaaaaaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前(姓)は10文字以下で入力してください", "名前(姓)は漢字で入力してください")
      end
      it 'last_nameが10文字より多い場合、登録できない' do
        @user.last_name = 'aaaaaaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前(名)は10文字以下で入力してください", "名前(名)は漢字で入力してください")
      end
      it 'first_name_kanaが10文字より多い場合、登録できない' do
        @user.first_name_kana = 'aaaaaaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("姓(カナ)は10文字以下で入力してください", "姓(カナ)はカタカナで入力してください")
      end
      it 'last_name_kanaが10文字より多い場合、登録できない' do
        @user.last_name_kana = 'aaaaaaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("名(カナ)は10文字以下で入力してください", "名(カナ)はカタカナで入力してください")
      end
      it 'first_nameが漢字以外では登録できない' do
        @user.first_name = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前(姓)は漢字で入力してください")
      end
      it 'last_nameが漢字以外ではでは登録できない' do
        @user.last_name = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前(名)は漢字で入力してください")
      end
      it 'first_name_kanaがカタカナ以外では登録できない' do
        @user.first_name_kana = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("姓(カナ)はカタカナで入力してください")
      end
      it 'last_name_kanaがカタカナ以外では登録できない' do
        @user.last_name_kana = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("名(カナ)はカタカナで入力してください")
      end
      it 'nicknameが複数ある場合、登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, nickname: @user.nickname)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("ニックネームは既に登録されています")
      end
      it 'emailが複数ある場合、登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("メールアドレスは既に登録されています")
      end
      it 'nicknameが20文字より多い場合、登録できない' do
        @user.nickname = 'aaaaaaaaaaaaaaaaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームは20文字以内で登録してください")
      end
      it 'passwordが8文字より少ない場合、登録できない' do
        @user.password = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは8文字以上で入力してください")
      end
    end
  end
end
