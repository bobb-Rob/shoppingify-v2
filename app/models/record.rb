class Record < ApplicationRecord
  belongs_to :list
  belongs_to :item

  validates :item_id, presence: { message: 'No Item selected' },
                      uniqueness: { scope: :list_id, message: 'Item is already in the list' }
end
