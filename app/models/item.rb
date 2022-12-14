class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :records
  has_many :lists, through: :records

  validates :name, presence: true, uniqueness: true
  validates :note, :user, :category, presence: true
end
