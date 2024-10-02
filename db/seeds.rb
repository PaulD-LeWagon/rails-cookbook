# heroku addons:create heroku-postgresql:essential-0

require "open-uri"
require "json"
require "faker"

categories = ["breakfast", "dessert", "seafood", "chicken", "beef", "pork"]

def recipe_builder(id)
  jr = URI.open("https://www.themealdb.com/api/json/v1/1/lookup.php?i=#{id}").read
  json = JSON.parse(jr)
  recipe = json["meals"].first
  Recipe.create(
    name: recipe["strMeal"],
    description: recipe["strInstructions"],
    image_url: recipe["strMealThumb"],
    rating: (rand(0..20).to_f * 0.5).round(1),
  )
end

puts "Cleaning out the DB..."
# Empty the database
Bookmark.destroy_all
puts "All Bookmarks destroyed..."
Category.all.each do |c|
  c.photo.purge if c.photo.attached?
  c.destroy
end
puts "All Categories destroyed..."
Recipe.destroy_all
puts "All Recipes destroyed..."

category_count = 0
recipe_count = 0
bookmark_count = 0

puts "Repopulating DB..."
categories.each do |cat|
  jr = URI.open("https://www.themealdb.com/api/json/v1/1/filter.php?c=#{cat}").read
  json = JSON.parse(jr)
  meals = json["meals"]
  if meals.is_a?(Array) && meals.length > 0
    meal = meals.first
    category = Category.new(name: cat.capitalize)
    category.photo.attach(io: URI.parse(meal["strMealThumb"]).open, filename: "#{cat.split.join("_")}.jpg")
    category.save
    category_count += 1
    puts "Category: #{cat.capitalize} created."
    meals.each_with_index do |r, i|
      break if i > 5 # Six recipes on each category pages is enough!
      recipe = recipe_builder(r["idMeal"])
      recipe_count += 1
      puts "Recipe: #{recipe.name} created."
      bookmark = Bookmark.new(
        comment: Faker::Lorem.paragraph(sentence_count: rand(3..7)),
        recipe: recipe,
        category: category,
      )
      bookmark.save
      bookmark_count += 1
      puts "Connecting bookmark created."
    end
  else
    p "Error: #{cat}", json
  end
end
puts "#{category_count} categories created.\n#{recipe_count} recipes created.\n#{bookmark_count} bookmarks created."
puts "#############\nReseeding complete!"
