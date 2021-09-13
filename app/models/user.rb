class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :first_name,      presence: true, length: {maximum: 10}, format: {with: /\A[一-龥]+\z/, message: "は漢字で入力して下さい。"}
  validates :last_name,       presence: true, length: {maximum: 10}, format: {with: /\A[一-龥]+\z/,  message: "は漢字で入力して下さい。"}
  validates :first_name_kana, presence: true, length: {maximum: 10}, format: {with: /\A[ァ-ヶー－]+\z/, message: "はカタカナで入力して下さい。"}
  validates :last_name_kana,  presence: true, length: {maximum: 10}, format: {with: /\A[ァ-ヶー－]+\z/, message: "はカタカナで入力して下さい。"}
  validates :nickname,        presence: true, uniqueness: true, length: {maximum: 20}
  validates :email,           presence: true, uniqueness: true
  validates :password,        presence: true, uniqueness: true, length: { minimum: 8 }, format: {with: /\A[a-zA-Z0-9]+\z/i,  message: "は英数字で入力して下さい。"} 
  
  def posts
    return Post.where(user_id: self.id)
  end
end

