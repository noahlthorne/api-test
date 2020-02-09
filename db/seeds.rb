require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "destroying old users..."
User.destroy_all
puts "creating new fake users..."
50.times do
  user = User.new
  user.first_name = Faker::Name.first_name
  user.last_name = Faker::Name.last_name
  user.email = Faker::Internet.email
  user.password = '#$taawktljasktlw4aaglj'
  user.save!
end

User.all.each do |user|
  rand(1..50).times do
    post = Post.create!(
      user: user,
      content: Faker::Food.description,
      likes: rand(1..999),
      retweets: rand(1..999),
    )
    post.created_at = (rand*10).days.ago
    post.save!
  end
  puts "created #{user.posts.count} posts for #{user.first_name} #{user.last_name}"
end

puts "created #{User.count} users and #{Post.count} total posts!"
