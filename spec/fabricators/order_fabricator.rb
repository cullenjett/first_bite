Fabricator(:order) do
  user_id { Faker::Number.number(1) }
  status { Faker::Lorem.word }
  type { Faker::Lorem.word }
end
