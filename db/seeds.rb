# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "faker"

Category.destroy_all
Bookmark.destroy_all
Recipe.destroy_all

categories = [Category.create(name: "Indian"),
              Category.create(name: "Fusion"),
              Category.create(name: "Italian"),
              Category.create(name: "French")]

50.times do
  r = Recipe.create(
    name: Faker::Food.dish,
    description: Faker::Food.description,
    image_url: Faker::LoremFlickr.image,
    rating: rand(0..10).to_f + [0, 0.5].sample,
  )
  b = Bookmark.new(comment: Faker::Lorem.paragraph(sentence_count: rand(3..7)), recipe: r, category: categories.sample)
  b.save
end
