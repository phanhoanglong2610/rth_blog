# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Clear old data
User.delete_all
Category.delete_all
Post.delete_all
Comment.delete_all

# Admin user
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

# Users
user1 = User.create(:email => "member1@example.com", :password => "member1456$%^")
user2 = User.create(:email => "member2@example.com", :password => "member2456$%^")

# Categories
category1 = Category.create(:name => "Ruby on Rails")
category2 = Category.create(:name => "Ruby")
category3 = Category.create(:name => "AngularJS")
category4 = Category.create(:name => "PHP")
category5 = Category.create(:name => "Others")

# Posts
post_title = "Lorem ipsum dolor sit amet"
post_body = "Lorem ipsum dolor sit amet, sed et novum melius complectitur. Vim fabellas accusata sensibus no, in sumo esse novum sed, ei vis dictas nusquam. Eos veri voluptatibus et, quem honestatis cu sit. Vel modo diam an, doctus scripserit vix te. Mel sint eripuit accusata ne."
post1 = Post.create(:title => post_title + " - 1", :body => post_body, :category_id => category1.id, :user_id => user.id)
post2 = Post.create(:title => post_title + " - 2", :body => post_body, :category_id => category1.id, :user_id => user.id)
post3 = Post.create(:title => post_title + " - 3", :body => post_body, :category_id => category1.id, :user_id => user.id)
post4 = Post.create(:title => post_title + " - 4", :body => post_body, :category_id => category2.id, :user_id => user1.id)
post5 = Post.create(:title => post_title + " - 5", :body => post_body, :category_id => category2.id, :user_id => user2.id)
post6 = Post.create(:title => post_title + " - 6", :body => post_body, :category_id => category3.id, :user_id => user2.id)

# Comments
comment_body = "Your article is great!"
comment1 = Comment.create(:body => comment_body, :user_id => user2.id, :post_id => post1.id)
comment2 = Comment.create(:body => comment_body, :user_id => user2.id, :post_id => post1.id)
comment3 = Comment.create(:body => comment_body, :user_id => user2.id, :post_id => post1.id)
comment4 = Comment.create(:body => comment_body, :user_id => user1.id, :post_id => post2.id)
comment5 = Comment.create(:body => comment_body, :user_id => user1.id, :post_id => post2.id)
comment6 = Comment.create(:body => comment_body, :user_id => user1.id, :post_id => post3.id)