class ListSerializer < ActiveModel::Serializer
  attributes :id, :name, :status, :categories
  
  def categories
    List.select('lists.id, lists.name, records.quantity').joins(:records)
    Record.where("item_id = ")
  end
end
