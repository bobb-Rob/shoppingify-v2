class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :note, :image, :category_name
  belongs_to :category

  def category_name
    object.category.name
  end
end
