class Recipe < ApplicationRecord
  has_many :bookmarks
  has_many :categories

  validates :name, :description, :image_url, :rating, presence: true
  validates :rating, inclusion: { in: 0..10 }
  validates :name, uniqueness: true
end
