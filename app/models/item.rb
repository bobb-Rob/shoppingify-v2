class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :records, dependent: :destroy
  has_many :lists, through: :records

  validates_uniqueness_of :name, scope: :user_id, message: '=> You have an item with the same name already'
  validates :name, presence: true
  validates :note, :user, presence: true
  # validates :category, presence: true
end
