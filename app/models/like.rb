class Like < ApplicationRecord
  visitable :ahoy_visit

  belongs_to :user
  belongs_to :post
  # validates :user, uniqueness: { scope: :post }

  scope :is_likes, -> { where(is_like: true) }
  scope :is_dislikes, -> { where(is_like: false) }
end
