class CategoryMap < ApplicationRecord
  belongs_to :tweet
  belongs_to :category
end
