class DefaultCategory < ApplicationRecord
  has_many :default_items, dependent: :destroy
end
