class List < ApplicationRecord
  belongs_to :user
  has_many :records, dependent: :destroy
  has_many :items, through: :records

  validates :name, presence: true, uniqueness: { scope: :user_id }
end
