Fabricator :product do
  title { Faker::Commerce.product_name }
  description { Faker::Lorem.sentence }
  price { Faker::Commerce.price }
end
