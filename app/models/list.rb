class List < ApplicationRecord
  belongs_to :user
  has_many :records, dependent: :destroy
  has_many :items, through: :records

  # validates :name, presence: true, uniqueness: { scope: :user_id }
  validates :status, uniqueness: { scope: :user_id }, unless: :value_is_cancel_or_complete?

  def value_is_cancel_or_complete?
    (status == 'cancel') || (status == 'complete')
  end
end
