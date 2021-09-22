require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'first_nameが空では登録できない' do
      
    end
    it 'last_nameが空では登録できない' do
      
    end
    it 'first_name_kanaが空では登録できない' do
      
    end
    it 'last_name_kanaが空では登録できない' do
      
    end
    it 'nicknameが空では登録できない' do
      
    end
    it 'emailが空では登録できない' do
      
    end
    it 'passwordが空では登録できない' do
      
    end
    it 'first_nameが10文字より多い場合、登録できない' do
      
    end
    it 'last_nameが10文字より多い場合、登録できない' do
      
    end
    it 'first_name_kanaが10文字より多い場合、登録できない' do
      
    end
    it 'last_name_kanaが10文字より多い場合、登録できない' do
      
    end
    it 'first_nameが漢字以外では登録できない' do
      
    end
    it 'last_nameが漢字以外ではでは登録できない' do
      
    end
    it 'first_name_kanaがカタカナ以外では登録できない' do
      
    end
    it 'last_name_kanaがカタカナ以外では登録できない' do
      
    end
    it 'nicknameが複数ある場合、登録できない' do
      
    end
    it 'emailが複数ある場合、登録できない' do
      
    end
    it 'passwordが複数ある場合、登録できない' do
      
    end
    it 'nicknameが20文字より多い場合、登録できない' do
      
    end

    it 'passwordが8文字より少ない場合、登録できない' do
      
    end
  end
end
