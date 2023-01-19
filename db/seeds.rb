# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')

first_post = Post.create(user: first_user, title: 'Hello', text: 'This is my first post')
second_post = Post.create(user: first_user, title: 'Healthy Lifestyles', text: 'This is my second post')
third_post = Post.create(user: first_user, title: 'Fasting', text: 'This is my third post')
fourth_post = Post.create(user: first_user, title: 'Food and Nutrition', text: 'This is my fourth post')
fifth_post = Post.create(user: first_user, title: 'Aging', text: 'This is my fifth post')

first = Post.create(user: second_user, title: 'DS & Algo', text: 'This is my first post')
second = Post.create(user: second_user, title: 'Querying Database', text: 'This is my second post')
third = Post.create(user: second_user, title: 'ORM', text: 'This is my third post')
fourth = Post.create(user: second_user, title: 'Angular', text: 'This is my fourth post')
fifth = Post.create(user: second_user, title: 'Vue', text: 'This is my fifth post')


Comment.create(post: first, user: second_user, text: 'Hi Tom! my first cimments' )
Comment.create(post: first, user: second_user, text: 'Hi Tom! my second cimments' )
Comment.create(post: first, user: second_user, text: 'Hi Tom! my third cimments' )
Comment.create(post: first, user: second_user, text: 'Hi Tom! my fourth cimments' )
Comment.create(post: first, user: second_user, text: 'Hi Tom! my fifth cimments' )
Comment.create(post: first, user: second_user, text: 'Hi Tom! my sixth cimments' )
Comment.create(post: first, user: second_user, text: 'Hi Tom! my seventh cimments' )

Comment.create(post: second, user: second_user, text: 'Hi Tom! my first cimments' )
Comment.create(post: second, user: second_user, text: 'Hi Tom! my second cimments' )
Comment.create(post: second, user: second_user, text: 'Hi Tom! my third cimments' )
Comment.create(post: second, user: second_user, text: 'Hi Tom! my fourth cimments' )
Comment.create(post: second, user: second_user, text: 'Hi Tom! my fifth cimments' )
Comment.create(post: second, user: second_user, text: 'Hi Tom! my sixth cimments' )
Comment.create(post: second, user: second_user, text: 'Hi Tom! my seventh cimments' )


Comment.create(post: third, user: second_user, text: 'Hi Tom! my first cimments' )
Comment.create(post: third, user: second_user, text: 'Hi Tom! my second cimments' )
Comment.create(post: third, user: second_user, text: 'Hi Tom! my third cimments' )
Comment.create(post: third, user: second_user, text: 'Hi Tom! my fourth cimments' )
Comment.create(post: third, user: second_user, text: 'Hi Tom! my fifth cimments' )
Comment.create(post: third, user: second_user, text: 'Hi Tom! my sixth cimments' )
Comment.create(post: third, user: second_user, text: 'Hi Tom! my seventh cimments' )

Comment.create(post: fourth, user: second_user, text: 'Hi Tom! my first cimments' )
Comment.create(post: fourth, user: second_user, text: 'Hi Tom! my second cimments' )
Comment.create(post: fourth, user: second_user, text: 'Hi Tom! my fourth cimments' )
Comment.create(post: fourth, user: second_user, text: 'Hi Tom! my fourth cimments' )
Comment.create(post: fourth, user: second_user, text: 'Hi Tom! my fifth cimments' )
Comment.create(post: fourth, user: second_user, text: 'Hi Tom! my sixth cimments' )
Comment.create(post: fourth, user: second_user, text: 'Hi Tom! my seventh cimments' )

Comment.create(post: fifth, user: second_user, text: 'Hi Tom! my first cimments' )
Comment.create(post: fifth, user: second_user, text: 'Hi Tom! my second cimments' )
Comment.create(post: fifth, user: second_user, text: 'Hi Tom! my fourth cimments' )
Comment.create(post: fifth, user: second_user, text: 'Hi Tom! my fourth cimments' )
Comment.create(post: fifth, user: second_user, text: 'Hi Tom! my fifth cimments' )
Comment.create(post: fifth, user: second_user, text: 'Hi Tom! my sixth cimments' )
Comment.create(post: fifth, user: second_user, text: 'Hi Tom! my seventh cimments' )


Comment.create(post: first_post, user: first_user, text: 'Hi Tom! my first new cimments' )
Comment.create(post: first_post, user: first_user, text: 'Hi Tom! my second new cimments' )
Comment.create(post: first_post, user: first_user, text: 'Hi Tom! my third new cimments' )
Comment.create(post: first_post, user: first_user, text: 'Hi Tom! my fourth new cimments' )
Comment.create(post: first_post, user: first_user, text: 'Hi Tom! my fifth new cimments' )
Comment.create(post: first_post, user: first_user, text: 'Hi Tom! my sixth new cimments' )
Comment.create(post: first_post, user: first_user, text: 'Hi Tom! my seventh new cimments' )

Comment.create(post: second_post, user: first_user, text: 'Hi Tom! my first cimments' )
Comment.create(post: second_post, user: first_user, text: 'Hi Tom! my second cimments' )
Comment.create(post: second_post, user: first_user, text: 'Hi Tom! my third cimments' )
Comment.create(post: second_post, user: first_user, text: 'Hi Tom! my fourth cimments' )
Comment.create(post: second_post, user: first_user, text: 'Hi Tom! my fifth cimments' )
Comment.create(post: second_post, user: first_user, text: 'Hi Tom! my sixth cimments' )
Comment.create(post: second_post, user: first_user, text: 'Hi Tom! my seventh cimments' )


Comment.create(post: third_post, user: first_user, text: 'Hi Tom! my first cimments' )
Comment.create(post: third_post, user: first_user, text: 'Hi Tom! my second cimments' )
Comment.create(post: third_post, user: first_user, text: 'Hi Tom! my third cimments' )
Comment.create(post: third_post, user: first_user, text: 'Hi Tom! my fourth cimments' )
Comment.create(post: third_post, user: first_user, text: 'Hi Tom! my fifth cimments' )
Comment.create(post: third_post, user: first_user, text: 'Hi Tom! my sixth cimments' )
Comment.create(post: third_post, user: first_user, text: 'Hi Tom! my seventh cimments' )

Comment.create(post: fourth_post, user: first_user, text: 'Hi Tom! my first cimments' )
Comment.create(post: fourth_post, user: first_user, text: 'Hi Tom! my second cimments' )
Comment.create(post: fourth_post, user: first_user, text: 'Hi Tom! my fourth cimments' )
Comment.create(post: fourth_post, user: first_user, text: 'Hi Tom! my fourth cimments' )
Comment.create(post: fourth_post, user: first_user, text: 'Hi Tom! my fifth cimments' )
Comment.create(post: fourth_post, user: first_user, text: 'Hi Tom! my sixth cimments' )
Comment.create(post: fourth_post, user: first_user, text: 'Hi Tom! my seventh cimments' )

Comment.create(post: fifth_post, user: first_user, text: 'Hi Tom! my first cimments' )
Comment.create(post: fifth_post, user: first_user, text: 'Hi Tom! my second cimments' )
Comment.create(post: fifth_post, user: first_user, text: 'Hi Tom! my fourth cimments' )
Comment.create(post: fifth_post, user: first_user, text: 'Hi Tom! my fourth cimments' )
Comment.create(post: fifth_post, user: first_user, text: 'Hi Tom! my fifth cimments' )
Comment.create(post: fifth_post, user: first_user, text: 'Hi Tom! my sixth cimments' )
Comment.create(post: fifth_post, user: first_user, text: 'Hi Tom! my seventh cimments' )

Like.create(user: first_user, post: first_post)
Like.create(user: first_user, post: second_post)
Like.create(user: first_user, post: third_post)

Like.create(user: first_user, post: first_post)
Like.create(user: first_user, post: second_post)
Like.create(user: first_user, post: third_post)

Like.create(post: first, user: second_user)
Like.create(post: second, user: second_user)
Like.create(post: third, user: second_user)

Like.create(post: first, user: second_user)
Like.create(post: first, user: second_user)
Like.create(post: first, user: second_user)





