class CategoryMap < ApplicationRecord
  belongs_to :tweet
  belongs_to :category

  validates :tweet_id, presence: true
  validates :category_id, presence: true
end
