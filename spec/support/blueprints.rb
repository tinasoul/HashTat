require 'faker'
require 'machinist/active_record'

User.blueprint do
  about_me { Faker::Lorem.paragraph(5) }
  email { Faker::Internet.email }
  fav_artist { Faker::Name.name }
  password { "test1234" }
  password_confirmation { password }
  location { 'Austin, TX' }
  memorable_story { Faker::Lorem.paragraph(10) }
  tat_number { 1 + rand(100).to_i }
  username { Faker::Name.first_name }
end
