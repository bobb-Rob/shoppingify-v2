require Rails.root.join("config/default_items")

class User < ApplicationRecord
  after_create :create_default_items

  has_many :items
  has_many :lists
  has_many :categories
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, format: URI::MailTo::EMAIL_REGEXP
  enum role: %i[user admin]

  # the authenticate method from devise documentation
  def self.authenticate(email, password)
    user = User.find_for_authentication(email:)
    user&.valid_password?(password) ? user : nil
  end

  def create_default_items
    fruits = self.categories.create(name: "Fruits")
    vegetables = self.categories.create(name: "Vegetables")
    meats = self.categories.create(name: "Meats")
    medicals = self.categories.create(name: "Medicals")

    items = [
      { name: "Apple", note: "Red and delicious", image: "apple.jpg", category: fruits },
      { name: "Orange", note: "Juicy and sweet", image: "orange.jpg", category: fruits },
      { name: "Banana", note: "Great for smoothies", image: "banana.jpg", category: fruits },
      { name: "Carrot", note: "Good for eyesight", image: "carrot.jpg", category: vegetables },
      { name: "Broccoli", note: "High in fiber", image: "broccoli.jpg", category: vegetables },
      { name: "Beef", note: "Great source of protein", image: "beef.jpg", category: meats },
      { name: "Chicken", note: "Low in fat", image: "chicken.jpg", category: meats },
      { name: "Pork", note: "Versatile and flavorful", image: "pork.jpg", category: meats },
      { name: "Aspirin", note: "Pain relief", image: "aspirin.jpg", category: medicals },
      { name: "Vitamin C", note: "Immune booster", image: "vitamin-c.jpg", category: medicals },
      { name: "Band-Aids", note: "For cuts and scrapes", image: "band-aids.jpg", category: medicals },
      { name: "Thermometer", note: "For checking temperature", image: "thermometer.jpg", category: medicals }
    ]
    
    items.each do |item|
      self.items.create(item)
    end
  end
end
