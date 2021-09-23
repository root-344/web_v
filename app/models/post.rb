class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  with_options presence: true do
    validates :content
    validates :user_id
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :genre
    
    validates :team_name, :genre_id, :date, :content, {presence: true}
    validates :genre_id, numericality: { other_than: 1 , message: "を選択してください"}


  def user
    return User.find_by(id: self.user_id)
  end
end
