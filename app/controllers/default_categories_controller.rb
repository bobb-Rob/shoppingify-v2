class DefaultCategoriesController < ApplicationController
  def index
    categories_with_items = DefaultCategory.all.includes(default_items: { image_attachment_attachment: :blob })
    categories_with_items.map do |category|
      {
        id: category.id,
        name: category.name,
        items: map_items(category.default_items)
      }
    end
    puts "All default_cat: #{categories_with_items}"
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
