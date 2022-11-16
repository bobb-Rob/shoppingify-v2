class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :name, presence: true, uniqueness: true 
  validates :note, :user, :category, presence: true
end
