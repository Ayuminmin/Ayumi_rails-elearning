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

Category.create(title: 'name',description: 'Who made that theorem?')
Category.create(title: 'physical constant',description: 'What does the physical constants represent?')
Category.create(title: 'physical quantity',description: 'What symbol represents the physical quantity?')
Category.create(title: 'calculation',description: 'Calculate the calculation.')
Category.create(title: 'number',description: 'Choose the number.')




users = User.all
user = users.first
following = users[1..50]
followers = users[1..50]
following.each { |followed| user.follow(followed)}
followers.each { |follower| follower.follow(user)}