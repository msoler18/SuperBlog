class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates_associated :user
  validates :title, presence: true
  validates :content, presence: true
  validates :content, length: {minimum: 250}
end
