require 'open-uri'
require 'json'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

drink_serialized = open(url).read
drink = JSON.parse(drink_serialized)

puts 'seeding'

drink["drinks"].each do |x|
  Ingredient.create(name: x["strIngredient1"])
end

puts 'Completed!'
