# class DefaultCategoriesController < ApplicationController
#   def index
#     # render json: return all categories with array of default items with image url with n+1 query
#     render json: DefaultCategory.includes(default_items: {image_attachment_attachment: :blob}).map { |category|
#       category.as_json.merge(
#         items: category.default_items.map { |item| 
#           # exclude default_category_id from being added as attribute of item
#           item.as_json(except: [:default_category_id]).merge(image: url_for(item.image_attachment), category_id: item.default_category.id)
#           }
#         )
#       }
#   end
# end

class DefaultCategoriesController < ApplicationController
  def index
    categories_with_items = DefaultCategory.includes(default_items: {image_attachment_attachment: :blob}).map do |category|
      {
        id: category.id,
        name: category.name,
        items: map_items(category.default_items)
      }
    end
    render json: categories_with_items
  end

  private

  def map_items(items)
    items.map do |item|
      {
        id: item.id,
        name: item.name,
        note: item.note,
        image: url_for(item.image_attachment),
        category_id: item.default_category_id
      }
    end
  end
end