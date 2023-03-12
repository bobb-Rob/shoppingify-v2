class User < ApplicationRecord
  # after_create :create_default_items

  has_many :items, dependent: :destroy
  has_many :lists, dependent: :destroy
  has_many :categories, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, format: URI::MailTo::EMAIL_REGEXP
  enum role: %i[user admin]

  # the authenticate method from devise documentation
  def self.authenticate(email, password)
    user = User.find_for_authentication(email:)
    user&.valid_password?(password) ? user : nil
  end

  # def create_default_items
  #   items = default_items
  #   items.each do |item|
  #     self.items.create(item)
  #   end
  # end

  # private

  # def default_items
  #   fruits = categories.create(name: 'Fruits')
  #   vegetables = categories.create(name: 'Vegetables')
  #   meats = categories.create(name: 'Meats')
  #   medicals = categories.create(name: 'Medicals')
  #   [
  #     { name: 'Apple', note: 'Red and delicious', image: 'apple.jpg', category: fruits },
  #     { name: 'Orange', note: 'Juicy and sweet', image: 'orange.jpg', category: fruits },
  #     { name: 'Banana', note: 'Great for smoothies', image: 'banana.jpg', category: fruits },
  #     { name: 'Carrot', note: 'Good for eyesight', image: 'carrot.jpg', category: vegetables },
  #     { name: 'Broccoli', note: 'High in fiber', image: 'broccoli.jpg', category: vegetables },
  #     { name: 'Beef', note: 'Great source of protein', image: 'beef.jpg', category: meats },
  #     { name: 'Chicken', note: 'Low in fat', image: 'chicken.jpg', category: meats },
  #     { name: 'Pork', note: 'Versatile and flavorful', image: 'pork.jpg', category: meats },
  #     { name: 'Aspirin', note: 'Pain relief', image: 'aspirin.jpg', category: medicals },
  #     { name: 'Vitamin C', note: 'Immune booster', image: 'vitamin-c.jpg', category: medicals },
  #     { name: 'Band-Aids', note: 'For cuts and scrapes', image: 'band-aids.jpg', category: medicals },
  #     { name: 'Thermometer', note: 'For checking temperature', image: 'thermometer.jpg', category: medicals }
  #   ]
  # end
end
