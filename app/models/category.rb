class Category < ApplicationRecord
  has_many :items, dependent: :destroy
  belongs_to :user

  validates :name, presence: true, uniqueness: { scope: :user_id }
end
