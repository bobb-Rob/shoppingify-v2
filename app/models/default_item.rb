class DefaultItem < ApplicationRecord
  belongs_to :default_category
  has_one_attached :image_attachment

  # no item should same name
  validates :name, uniqueness: true
end
