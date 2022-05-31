class Post < ApplicationRecord
  validates :title, :user_id, presence: true
  validates :description, length: { minimum: 10, maximum: 1500 }
  belongs_to :user
end
