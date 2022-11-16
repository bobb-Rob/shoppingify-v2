class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :note, :image
end
