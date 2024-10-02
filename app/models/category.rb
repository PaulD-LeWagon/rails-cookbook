class Category < ApplicationRecord
  has_one_attached :photo
  has_many :bookmarks, dependent: :destroy
  has_many :recipes, through: :bookmarks # , dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
