class Post < ApplicationRecord
  visitable :ahoy_visit
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  belongs_to :user
  validates :title , presence: true
  validates :body, length: { minimum: 1, maximum: 10000 }
end
