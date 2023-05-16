class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :records, dependent: :destroy
  has_many :lists, through: :records
  # Associate the image with the item thorugh Active Storage
  has_one_attached :image_attachment

  validates_uniqueness_of :name, scope: :user_id, message: '=> You have an item with the same name already'
  validates :name, presence: true
  validates :note, :user, presence: true
  # validates :category, presence: true
end

# In my react front end, user can create item with either url of
# an image or an actual image file. In rails backend, I have an item model with
# name, note, image, and category columns. When a user creates an item, i want a route that will be
# able to create an item image using either url or image file. Please use active_storage gem for
# this implemntation. Provide full code imlementation.
