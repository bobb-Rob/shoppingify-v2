class ListSerializer < ActiveModel::Serializer
  attributes :id, :name, :status, :records

  has_many :records
end
