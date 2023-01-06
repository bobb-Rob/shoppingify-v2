class ListSerializer < ActiveModel::Serializer
  attributes :id, :name, :status, :items
  
  # has_many :items
  has_many :records

  def items
    object.items
  end
end
