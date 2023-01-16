class RecordSerializer < ActiveModel::Serializer
  attributes :id, :item

  belongs_to :item

  def item
    {
      id: object.item.id,
      name: object.item.name,
      note: object.item.note,
      image: object.item.image,
      categoryName: object.item.category.name,
      quantity: object.quantity,
      completed: object.completed,
      recordId: object.id
    }
  end
end
