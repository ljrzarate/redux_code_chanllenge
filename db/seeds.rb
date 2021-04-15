# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# USERS
u1 = User.create(email: "test1@test.com", password: "Password!", password_confirmation: "Password!", username: "test1")
u2 = User.create(email: "test2@test.com", password: "Password!", password_confirmation: "Password!", username: "test2")
u3 = User.create(email: "test3@test.com", password: "Password!", password_confirmation: "Password!", username: "test3")

puts "Users Saved"

# POSTS
post1 = Post.first_or_initialize(content: "Im a post 1")
post2 = Post.first_or_initialize(content: "Im a post 2")
post3 = Post.first_or_initialize(content: "Im a post 3")

post1.user = u1
post2.user = u2
post3.user = u3

post1.save!
post2.save!
post3.save!
puts "Posts Saved"

# COMMENTS
comment1 = Comment.first_or_initialize(content: "comment 1")
comment2 = Comment.first_or_initialize(content: "comment 2")
comment3 = Comment.first_or_initialize(content: "comment 3")

comment1.post = post1
comment2.post = post2
comment3.post = post3

comment1.user = u3
comment2.user = u1
comment3.user = u2

comment1.save!
comment2.save!
comment3.save!
puts "Comments Saved"
