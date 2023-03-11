class DefaultCategoriesController < ApplicationController
  def index
    # render json: return all categories with array of default items with image url with n+1 query
    render json: DefaultCategory.includes(default_items: {image_attachment_attachment: :blob}).map { |category|
      category.as_json.merge(
        default_items: category.default_items.map { |item| 
          item.as_json.merge(image_url: url_for(item.image_attachment)) })
    }
  end
end
