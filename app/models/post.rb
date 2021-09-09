class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :content, {presence: true, length: {maximum: 300}}
  validates :user_id, {presence: true}

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :genre
    
    validates :team_name, :genre_id, :content, {presence: true}
    validates :genre_id, numericality: { other_than: 1 , message: "選択してください"}


  def user
    return User.find_by(id: self.user_id)
  end
end
