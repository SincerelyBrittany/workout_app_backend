Fabricator(:workout) do
    name { Faker::Name.name }
    url { Faker::Name.name }
    time { "2020-09-18 23:43:11" }
    category_id{ 3 }
end