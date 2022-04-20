class Tweet < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes
  has_many :category_maps, dependent: :destroy
  has_many :categories, through: :category_maps
end
