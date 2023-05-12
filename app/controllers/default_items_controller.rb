class DefaultItemsController < ApplicationController
  def index
    default_items = DefaultItem.all.map do |item|
      item.as_json.merge(
        image: url_for(item.image_attachment),
        category_name: item.default_category.name,
        category: {
          id: item.default_category.id,
          name: item.default_category.name
        }
      )
    end
  
    render json: default_items
  end
end
