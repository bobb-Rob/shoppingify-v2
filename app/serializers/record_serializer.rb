class RecordSerializer < ActiveModel::Serializer
  attributes :id
 
  belongs_to :item

  def item
    {
      id: object.item.id,
      name: object.item.name,
      note: object.item.note,
      image: object.item.image,
      categoryName: object.item.category.name,
      quantity: object.quantity
    }
  end
end
