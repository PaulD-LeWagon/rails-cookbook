class Recipe < ApplicationRecord
  has_many :bookmarks
  has_many :categories
  # Testing 1, 2, 3...
  validates :overview, presence: true
  validates :title, presence: true, uniqueness: true
end
