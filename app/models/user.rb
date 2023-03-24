class User < ApplicationRecord
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
end
