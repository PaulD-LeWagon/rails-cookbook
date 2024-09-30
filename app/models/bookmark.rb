class Bookmark < ApplicationRecord
  belongs_to :recipe
  belongs_to :category

  validates_associated :recipe
  validates_associated :category

  validates_presence_of :recipe
  validates_presence_of :category

  validates :recipe_id, uniqueness: { scope: :category_id }
  validates :comment, length: { minimum: 6 }
end
