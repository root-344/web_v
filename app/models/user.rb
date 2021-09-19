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
    validates :password
    with_options length: {maximum: 10} do
      validates :first_name
      validates :last_name
      validates :first_name_kana
      validates :last_name_kana
      with_options format: {with: /\A[一-龥]+\z/, message: "は漢字で入力して下さい。"} do
        validates :first_name
        validates :last_name
      end
      with_options format: {with: /\A[ァ-ヶー－]+\z/, message: "はカタカナで入力して下さい。"} do
        validates :first_name_kana
        validates :last_name_kana
      end
    end
    with_options uniqueness: true do
      validates :nickname, length: {maximum: 20}
      validates :email
      validates :password, length: { minimum: 8 }, format: {with: /\A[a-zA-Z0-9]+\z/i,  message: "は英数字で入力して下さい。"}   
    end
  end


  def posts
    return Post.where(user_id: self.id)
  end
end

