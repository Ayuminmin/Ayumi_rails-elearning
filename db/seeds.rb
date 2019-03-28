require 'faker'

User.create(
    name: 'ayumi',
    email: 'masamichiayu@gmail.com',
    password: 'ayumiayumi',
    admin: '1'
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
following = users[5..50]
followers = users[3..50]
following.each { |followed| user.follow(followed)}
followers.each { |follower| follower.follow(user)}