class Tweet < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes
  has_many :category_maps, dependent: :destroy
  has_many :categories, through: :category_maps

  def save_category(sent_categories)
    current_categories = self.categories.pluck(:category_name) unless self.categories.nil?
    old_categories = current_categories - sent_categories
    new_categories = sent_categories - current_categories

    old_categories.each do |old|
      self.categories.delete(Category.find_by(category_name: old))
    end

    new_categories.each do |new|
      new_tweet_category = Category.find_or_create_by(category_name: new)
      self.categories << new_tweet_category
    end
  end
end