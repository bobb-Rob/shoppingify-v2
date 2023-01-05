class RecordSerializer < ActiveModel::Serializer
  attributes :id, :quantity
  belongs_to :list
  belongs_to :item
end
