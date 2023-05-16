class Api::V1::DefaultCategoriesController < ApiController
  def index
    # render json: return all categories with only name and id fields
    render json: DefaultCategory.all, only: %i[name id]
  end

  def create
    default_category_ids = params[:selectedCategoriesIds]
    if default_category_ids.empty?
      # return an error message - no default_category_ids were provided, please provide default_category_ids
      render json: { errors: 'No default_category_ids were provided, please provide default_category_ids' },
             status: :unprocessable_entity
    else
      default_categories = DefaultCategory.where(id: default_category_ids).includes(:default_items)

      success = true
      categories = create_categories(default_categories, current_user.id)
      success &&= categories.present?

      create_items(default_categories, categories, current_user.id)
      success &&= true

      transfer_image_attachments(default_categories)
      success &&= true

      if success
        render json: { message: 'Default categories were created successfully' }, status: :ok
      else
        render json: { errors: 'Failed to create default categories' }, status: :unprocessable_entity
      end
    end
  end

  private

  def create_categories(default_categories, user_id)
    new_categories = default_categories.map do |default_category|
      Category.new(name: default_category.name, user_id:)
    end
    Category.import(new_categories)
    new_categories
  end

  def create_items(default_categories, categories, user_id)
    new_items = []
    default_categories.each_with_index do |default_category, index|
      default_category.default_items.each do |default_item|
        item = Item.new(
          name: default_item.name,
          user_id:,
          category_id: categories[index].id,
          note: default_item.note,
          image: 'https://media.istockphoto.com/id/171302954/photo/groceries.jpg?s=612x612&w=0&k=20&c=D3MmhT5DafwimcYyxCYXqXMxr1W25wZnyUf4PF1RYw8='
        )
        new_items << item
      end
    end

    Item.import(new_items)
    new_items
  end

  def transfer_image_attachments(default_categories)
    default_categories.each do |default_category|
      default_category.default_items.each do |default_item|
        item = Item.find_by(name: default_item.name)

        next unless default_item.image_attachment.attached?

        begin
          item.image_attachment.attach(default_item.image_attachment.blob)
        rescue StandardError => e
          item.errors.add(:image_attachment, "could not be transferred: #{e.message}")
        end
      end
    end
  end
end
