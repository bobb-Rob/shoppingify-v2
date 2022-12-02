class RecordSerializer < ActiveModel::Serializer
  attributes :id, :quantity
  has_one :list
  has_one :item
end
