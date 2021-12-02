30.times do |n|
  User.seed do |u|
    u.id = n + 1
    u.name = Faker::Name.name
    u.email = Faker::Internet.email
    u.imageUrl = 'sampleImage.png'
    u.token = 'samlpe token'
  end
end
