class Record < ApplicationRecord
  belongs_to :list
  belongs_to :item

  validates :item_id, presence: true, uniqueness: { scope: :list_id }
end
