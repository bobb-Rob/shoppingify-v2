class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :records, dependent: :destroy
  has_many :lists, through: :records

  validates :name, presence: true, uniqueness: { scope: :user_id }
  validates :note, :user, :category, presence: true
end
