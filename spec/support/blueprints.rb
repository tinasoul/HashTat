require 'faker'
require 'machinist/active_record'


Artist.blueprint do
  first_name   { Faker::Name.first_name }
  last_name    { Faker::Name.last_name }
  full_name    { 'Foo man choo' }
  location     { 'NYC' }
  tattoo_shop  { 'Hash Tatts' }
  specialties  { Faker::Lorem.paragraph(1) }
  bio          { Faker::Lorem.paragraph(10) }
  email        { Faker::Internet.email }
  phone        { '555-555-5555' }
  color_scheme { %w[red blue green black].sample }
end

Comment.blueprint do
  comment_content { Faker::Lorem.paragraph }
end

Tattoo.blueprint do
  artist_name   { Faker::Name.name }
  body_location { %w[arm leg back].sample }
  description   { Faker::Lorem.paragraph }
  gender        { %w[male female].sample }
  hashtags      { '#myreallycooltatt #tattoosareme' }
  location      { 'Abu Dabi' }
  # AWS credentials not valid
  # picture do
  #   Rack::Test::UploadedFile.new(
  #     Rails.root.join('spec', 'support', 'tat_imgs', 'tattoo1.jpg'),
  #     'image/jpg'
  #   )
  # end
  studio        { 'Tickety Tatt' }
end

Tweet.blueprint do
  handle { Faker::Name.first_name }
  text   { Faker::Lorem.paragraph(1) }
end

User.blueprint do
  about_me        { Faker::Lorem.paragraph(5) }
  email           { Faker::Internet.email }
  fav_artist      { Faker::Name.name }
  location        { 'Austin, TX' }
  memorable_story { Faker::Lorem.paragraph(10) }
  password        { "test1234" }
  password_confirmation { object.password }
  tat_number      { 1 + rand(100).to_i }
  username        { Faker::Name.first_name }
end
