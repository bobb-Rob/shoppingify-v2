class List < ApplicationRecord
  belongs_to :user
  has_many :records
  has_many :items, through: :records
end
