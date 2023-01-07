class ListSerializer < ActiveModel::Serializer
  attributes :id, :name, :status, :items
  
  has_many :items  
end
