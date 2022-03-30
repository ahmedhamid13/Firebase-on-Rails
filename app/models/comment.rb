class Comment < ApplicationRecord
  visitable :ahoy_visit

  belongs_to :user
  belongs_to :post
  validates :body , presence: true
  validates :body, length: { minimum: 1, maximum: 3000 }
end
