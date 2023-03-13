class Api::V1::DefaultCategoriesController < ApiController
  def index
    # render json: return all categories with only name and id fields
    render json: DefaultCategory.all, only: %i[name id]
  end

  # def create
  #   # Receive an array of default_category_ids from params and, fetch the default_categories from DefaultCategory Model
  #   # Use catorgory_ids to get the categories
  #   # then create new Categories with the same name and user_id
  #   # Create Items associated with fetched default_categories and new categories

  #   default_categories = DefaultCategory.where(id: params[:default_category_ids]).includes(:default_items)

  #   default_categories.each do |default_category|
  #     category = Category.create(name: default_category.name, user_id: current_user.id)
  #     default_category.default_items.each do |default_item|
  #       item = Item.new(
  #         name: default_item.name,
  #         note: default_item.note,
  #         image: 'https://media.istockphoto.com/id/171302954/photo/groceries.jpg?s=612x612&w=0&k=20&c=D3MmhT5DafwimcYyxCYXqXMxr1W25wZnyUf4PF1RYw8=',
  #         category_id: default_category.id,
  #         user_id: current_user.id)

  #       if default_item.image_attachment.attached?
  #         begin
  #           item.image_attachment.attach(default_item.image_attachment.blob)
  #         rescue => e
  #           item.errors.add(:image_attachment, "could not be transferred: #{e.message}")
  #         end
  #       end
        
  #       if item.save
  #         # Item was saved successfully
  #       else
  #         # Handle validation errors and provide appropriate feedback to the user
          
  #         # Build a list of error messages
  #         error_messages = []
  #         item.errors.full_messages.each do |message|
  #           error_messages << message
  #         end
          
  #         # Return the error messages as a JSON response
  #         render json: { errors: error_messages }, status: :unprocessable_entity
  #       end
  #     end
  #   end
  # end

  def create
    default_categories = DefaultCategory.where(id: params[:default_category_ids]).includes(:default_items)

    categories = create_categories(default_categories, current_user.id)

    create_items = create_items(default_categories, categories, current_user.id)

    transfer_image_attachments(default_categories)
  end

  private

  def create_categories(default_categories, user_id)
    new_categories = default_categories.map do |default_category|
      Category.new(name: default_category.name, user_id: user_id)
    end
    Category.import(new_categories)
  
    new_categories
  end

  def create_items(default_categories, categories, user_id)
    new_items = []

    default_categories.each do |default_category|
      default_category.default_items.each do |default_item|
        item = Item.new(
          name: default_item.name,
          user_id: user_id,
          category_id: default_category.id,
          note: default_item.note,
          image: 'https://media.istockphoto.com/id/171302954/photo/groceries.jpg?s=612x612&w=0&k=20&c=D3MmhT5DafwimcYyxCYXqXMxr1W25wZnyUf4PF1RYw8='
        )
        new_items << item
      end
    end
  
    Item.import(new_items)
  end

  def transfer_image_attachments(default_categories)
    default_categories.each do |default_category|
      default_category.default_items.each do |default_item|
        item = Item.find_by(name: default_item.name)
  
        if default_item.image_attachment.attached?
          begin
            item.image_attachment.attach(default_item.image_attachment.blob)
          rescue => e
            item.errors.add(:image_attachment, "could not be transferred: #{e.message}")
          end
        end
      end
    end
  end
end
