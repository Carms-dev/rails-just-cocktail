require 'open-uri'
require 'json'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

drink_serialized = open(url).read
drink = JSON.parse(drink_serialized)

puts 'seeding'

drink["drinks"].each do |x|
  Ingredient.create(name: x["strIngredient1"])
end

Cocktail.create(name: 'Mojito', url: 'https://www.thespruceeats.com/thmb/SoTswmBSV9xR8VGtxhBcbWNL6d4=/960x0/filters:no_upscale():max_bytes(150000):strip_icc()/mojito-5a8f339fba61770036ec61d8.jpg')
Cocktail.create(name: 'Piña colada', url: 'https://www.thespruceeats.com/thmb/yGgUHcTYwSPDwvVZwSlPM_4vAl8=/1820x1365/smart/filters:no_upscale()/frozen-pina-colada-recipe-759297-4_preview1-5b02fa8ca18d9e003cddc746.jpeg')
Cocktail.create(name: 'Cucumber Mint Gimlet', url: 'https://nerdswithknives.com/wp-content/uploads/2015/08/IMG_6231-Version-2.jpg')
Cocktail.create(name: 'Spanish Gin Tonic', url: 'https://www.foxandbriar.com/wp-content/uploads/2016/07/Spanish-Gin-Tonics-7-of-19.jpg')
Cocktail.create(name: 'Mango Spice', url: 'https://partaste.com/worldrecipes/wp-content/uploads/sites/2/2015/06/mango_con_chile.jpg')
Cocktail.create(name: 'Old Fashioned', url: 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/index-1549384787.jpg')
Cocktail.create(name: 'Margarita', url: 'https://www.makeitgrateful.com/wp-content/uploads/2019/04/frozen-mango-lava-margarita-recipe.jpg')
Cocktail.create(name: 'Cosmopolitan', url: 'https://images.food52.com/dPw4rw_GCEPV6T-eHD0Az06c-to=/1200x900/4af84f60-dc41-4b3e-ae24-068bb2d5bed0--2019-0905_cosmopolitan_3x2_rocky-luten_069.jpg')

puts 'Completed!'
