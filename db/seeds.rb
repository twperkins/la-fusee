require "open-uri"

if Rails.env.development?
    puts "Destroying spaceships..."
  Spaceship.destroy_all
  puts "Destroying users..."
  User.destroy_all

  puts "Destroying bookings..."
  Booking.destroy_all
end

5.times do
  file = URI.open('https://source.unsplash.com/random/800x600')
  user = User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    name: Faker::Internet.user
  )
  puts "#{user.password}"
  puts "#{user.email}"
  user.image_url.attach(io: file, filename: 'test.png', content_type: 'image/png')
  puts "adding new user"
  3.times do
    file = URI.open('https://source.unsplash.com/random/800x600')
    spaceship = Spaceship.create!(
      name: Faker::Space.moon,
      capacity: [2, 4, 6, 8].sample,
      description: Faker::Space.agency,
      user_id: user.id
    )
    spaceship.image_url.attach(io: file, filename: 'test.png', content_type: 'image/png')
    puts "adding new spaceship"
  end
end

5.times do
  file = URI.open('https://source.unsplash.com/random/800x600')
  user = User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    name: Faker::Internet.user
  )
  user.image_url.attach(io: file, filename: 'test.png', content_type: 'image/png')
  puts "adding new user"
end
