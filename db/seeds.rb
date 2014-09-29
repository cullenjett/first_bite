Product.destroy_all
Category.destroy_all
Order.destroy_all
OrderItem.destroy_all
User.destroy_all

10.times do
  Product.create(title: Faker::Commerce.product_name,
                  description: Faker::Lorem.sentence,
                  price: Faker::Commerce.price)
end

entree = Category.create(title: 'Entree')
appetizer = Category.create(title: 'Appetizer')
dessert = Category.create(title: 'Dessert')
drink = Category.create(title: 'Drink')

Product.all.each do |product|
  product.categories << [entree, appetizer, dessert, drink].sample
end
