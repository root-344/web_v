class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :first_name, presence: true, length: {maximum: 10}, format: {with: /\A[一-龥]+\z/}
  validates :last_name, presence: true, length: {maximum: 10}, format: {with: /\A[一-龥]+\z/}
  validates :first_name_kana, presence: true, length: {maximum: 10}, format: {with: /\A[ァ-ヶー－]+\z/}
  validates :last_name_kana, presence: true, length: {maximum: 10}, format: {with: /\A[ァ-ヶー－]+\z/}
  validates :nickname, presence: true, uniqueness: true, length: {maximum: 20}
  validates :password, presence: true, uniqueness: true, length: { minimum: 8 }, format: {with: /\A[a-zA-Z0-9]+\z/i} 
  
  def posts
    return Post.where(user_id: self.id)
  end
end

