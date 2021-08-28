class Post < ApplicationRecord
  validates :content, {presence: true, length: {maximum: 300}}
  validates :user_id, {presence: true}
end
