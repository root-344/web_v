class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, {presence: true, length: {maximum: 10}}
  validates :email, {presence: true, uniqueness: true}
  validates :password, {presence: true}
  
  def posts
    return Post.where(user_id: self.id)
  end
end

