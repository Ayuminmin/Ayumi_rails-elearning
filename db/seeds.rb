require 'faker'

User.create(
    name: 'Test User',
    email: 'test@gmail.com',
    password: 'password'
)

50.times do |n|
    User.create(
        name: Faker::Name::name,
        email: Faker::Internet.unique.email,
        password: 'password'
    )
end