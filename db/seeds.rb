require 'faker'
require 'securerandom'

# setup admin account
admin = User.new(
  name: 'Jose',
  email: 'admin@example.com',
  password: 'Password'
)
admin.save

second_user = User.new(
  name: 'Tux',
  email: 'tux@example.com',
  password: 'Password'
)
second_user.save

# create some users
3.times do
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.safe_email,
    password: Faker::Lorem.characters(10)
  )
  # user.skip_confirmation!
  user.save
end

users = User.all

30.times do
  domain = Faker::Internet.domain_name
  site = Website.new(
    name: domain,
    url: 'http://www.' + domain,
    user: users.sample,
    verification_token: SecureRandom.hex(12)
  )
  site.save
end

puts "Finished Seeding Data"
puts "#{User.count} users creates"
puts "#{Website.count} websites generated"
