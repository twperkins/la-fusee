require "open-uri"

if Rails.env.development?
  puts "Destroying bookings..."
  Booking.destroy_all
  puts "Destroying spaceships..."
  Spaceship.destroy_all
  puts "Destroying planets..."
  Destination.destroy_all
  puts "Destroying users..."
  User.destroy_all
end

user1 = User.create!(
  email: "demo@email.com",
  password: "123123",
  name: "Joanna"
)
file = URI.open('https://source.unsplash.com//800x600/?person')
user1.image_url.attach(io: file, filename: 'test.png', content_type: 'image/png')

5.times do
  file = URI.open('https://source.unsplash.com//800x600/?person')
  user = User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    name: Faker::Internet.user
  )

  user.image_url.attach(io: file, filename: 'test.png', content_type: 'image/png')
  puts "adding new user"

  5.times do
    file = URI.open('https://source.unsplash.com//800x600/?rocket')
    spaceship = Spaceship.create!(
      name: Faker::Space.moon,
      capacity: [2, 4, 6, 8].sample,
      description: Faker::Space.agency,
      user_id: user.id,
      cost: [100, 200, 500, 1000, 5000].sample
    )
    spaceship.image_url.attach(io: file, filename: 'test.png', content_type: 'image/png')
    puts "adding new spaceship"
  end
end

5.times do
  file = URI.open('https://source.unsplash.com//800x600/?person')
  user = User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    name: Faker::Internet.user
  )
  user.image_url.attach(io: file, filename: 'test.png', content_type: 'image/png')
  puts "adding new user"
end

5.times do
  file = URI.open('https://source.unsplash.com//800x600/?planet')
  destination = Destination.create!(
    name: %w[Mars Moon].sample, # Faker::Space.planet ,
    flight_time: rand(2..100)
  )
  destination.image_url.attach(io: file, filename: 'test.png', content_type: 'image/png')
  puts "adding new planet"
end
