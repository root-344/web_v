class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :content, {presence: true, length: {maximum: 300}}
  validates :user_id, {presence: true}

  def user
    return User.find_by(id: self.user_id)
  end
end
