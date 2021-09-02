class User < ApplicationRecord
  validates :name, {presence: true, length: {maximum: 10}}
  validates :email, {presence: true, uniqueness: true}
  validates :password, {presence: true}
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  validates :comment_text, presence: true, length: { maximum: 1000 }

  def posts
    return Post.where(user_id: self.id)
  end
end

