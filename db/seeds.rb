# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



r1 = Role.create({name: "User", description: "Can read and create items. Can update and destroy own items"})
r2 = Role.create({name: "Admin", description: "Can perform any CRUD operation on any resource"})

u1 = User.create({name: "Petr", email: "pp@example.com", password: "1234512345", password_confirmation: "1234512345", role_id: r1.id})
u2 = User.create({name: "Pavel", email: "ppp@example.com", password: "1234512345", password_confirmation: "1234512345", role_id: r1.id})
u3 = User.create({name: "Phew", email: "ppp@example.com", password: "1234512345", password_confirmation: "1234512345", role_id: r2.id})


i1 = Article.create({title: "Rayban", text: "Stylish shades", user_id: u1.id})
i2 = Item.create({title: "Watch", text: "Expensive timepiece", user_id: u2.id})
i3 = Item.create({title: "Henri Lloyd Pullover", text: "Classy knitwear", user_id: u3.id})
i4 = Item.create({title: "Porsche socks", text: "Cosy footwear", user_id: u3.id})