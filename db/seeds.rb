# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Sign up a user

# {
#   "first_name": "John",
#   "last_name": "Doe",
#   "email": "johndoe@g.com",
#   "password": "password",
#   "client_id": "TMoOlJ0URCR917tR7O5pq7nBrqfBtpBjEsI9bFr3ja0"
# }

# Sign in or get access token
# {
#   "grant_type": "password",
#   "email": "johndoe@g.com",
#   "password": "password",
#   "client_id": "-ud2l-0bDZgA0-8DQshETRyY7hw52vVfgNN31k6CSnQ",
#   "client_secret": "k0zYwVpAJVtLT675yKxxihU4owMmrQ5LIv-2XQI3PMM"
# }

# create Item
# {
#   "name": "Item 1",
#   "note": "Note 1",
#   "category_id": 1,
#   "user_id": 3
# }

# create Category
# {
#   "name": "Vegetables"
# }

# create Oauth client using doorkeeper gem
if Doorkeeper::Application.count.zero?
  Doorkeeper::Application.create(name: 'iOS client', redirect_uri: '', scopes: '')
  Doorkeeper::Application.create(name: 'Android client', redirect_uri: '', scopes: '')
  Doorkeeper::Application.create(name: 'React', redirect_uri: '', scopes: '')
end

User.first_or_create!(email: 'robertson@dev.io',
                      password: 'password',
                      password_confirmation: 'password',
                      role: User.roles[:admin])

#                       {
#     "name": "React",
#     "client_id": "ygliYZcduucRdto0TZyQnhfFcgovWC61OTz-VA2Yj9E",
#     "client_secret": "QgamqEEWPkn5IPUkwV-qfLwRemQlp-2H6grwJNPA2e0",
#     "created_at": "2022-12-21T00:24:42.930Z"
# }