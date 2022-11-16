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
#   "client_id": "TMoOlJ0URCR917tR7O5pq7nBrqfBtpBjEsI9bFr3ja0",
#   "client_secret": "7E0QFep8vl48pL0NHJGMN57Aj13tz0OZf_8_ykTAik4" 
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
  Doorkeeper::Application.create(name: "iOS client", redirect_uri: "", scopes: "")
  Doorkeeper::Application.create(name: "Android client", redirect_uri: "", scopes: "")
  Doorkeeper::Application.create(name: "React", redirect_uri: "", scopes: "")
end

User.first_or_create!(email: "robertson@dev.io",
  password: "password", 
  password_confirmation: "password",
  role: User.roles[:admin])
  