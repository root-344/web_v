class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  with_options presence: true do
    validates :first_name
    validates :last_name
    validates :first_name_kana
    validates :last_name_kana
    validates :nickname
    validates :email
    validates :password, length: { minimum: 8, message: "は8文字以上で入力してください" }, format: {with: /\A[a-zA-Z0-9]+\z/i,  message: "は英数字で入力してください"}
    with_options length: {maximum: 10,  message: "は10文字以下で入力してください"} do
      validates :first_name
      validates :last_name
      validates :first_name_kana
      validates :last_name_kana
      with_options format: {with: /\A[一-龥]+\z/,  message: "は漢字で入力してください"} do
        validates :first_name
        validates :last_name
      end
      with_options format: {with: /\A[ァ-ヶー－]+\z/, message: "はカタカナで入力してください"} do
        validates :first_name_kana
        validates :last_name_kana
      end
    end
    with_options uniqueness: { case_sensitive: true, message: "は既に登録されています" } do
      validates :nickname, length: {maximum: 20, message: "は20文字以内で登録してください"}
      validates :email
    end
  end


  def posts
    return Post.where(user_id: self.id)
  end
end

