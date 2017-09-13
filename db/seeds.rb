standard = User.create!(
  email:    'carissabcastro@gmail.com',
  password: 'helloworld'
)

# Create applications
10.times do
  application = Application.create!(
    user: User.first,
    name: Faker::App.name,
    url: Faker::Internet.url
  )
end
applications = Application.all

# Create events
50.times do
  event = Event.create!(
    name: Faker::Space.planet,
    application: applications.sample
  )
end
events = Event.all


puts "Seed finished"
puts "#{User.count} users created"
puts "#{Application.count} applications created"
puts "#{Event.count} events created"
