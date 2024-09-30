class Recipe < ApplicationRecord
  has_many :bookmarks
  has_many :categories

  validates :overview, presence: true
  validates :title, presence: true, uniqueness: true
end
