class Category < ApplicationRecord
  has_many :category_maps, dependent: :destroy, foreign_key: 'category_id'
  has_many :tweets, through: :category_maps
end
