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


users = User.all
user = users.first
following = users[5..45]
followers = users[3..33]
following.each { |followed| user.follow(followed)}
followers.each { |follower| follower.follow(user)}