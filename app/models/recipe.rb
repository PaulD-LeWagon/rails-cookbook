class Recipe < ApplicationRecord
  has_many :bookmarks
  has_many :categories

  validates :name, :description, :image_url, :rating, presence: true
  validates :name, uniqueness: true
end
