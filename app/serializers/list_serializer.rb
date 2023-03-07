class ListSerializer < ActiveModel::Serializer
  attributes :id, :name, :status, :records, :created_at

  has_many :records

  def created_at
    object.created_at
  end
end
