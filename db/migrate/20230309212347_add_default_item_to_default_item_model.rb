require_relative '../../config/initializers/default_items.rb'

class AddDefaultItemToDefaultItemModel < ActiveRecord::Migration[7.0]
  def change
    # Set batch size and sleep time between batches
    batch_size = 20
    sleep_time = 3 # seconds
  
    # Read all image files into memory using the image file name as the key
    image_path = "C:/Users/BOBB-ROB/Desktop/projects/shoppingify/shoppingify-backend-v2/app/assets/images/item_images/"
    image_files_hash = {}
    
    Dir.entries(image_path).each do |file|
      next if File.directory?(file)
      file_name = File.basename(file, File.extname(file))
      image_files_hash[file_name] = File.open(File.join(image_path, file))
    end
  
    # Do bulk find by name to avoid multiple queries
    category_names = DEFAULT_ITEMS.map { |item| item[:default_category] }.uniq
    categories = DefaultCategory.where(name: category_names).includes(:default_items)
    category_table = categories.index_by(&:name)
  
    # Process items in batches
    DEFAULT_ITEMS.each_slice(batch_size) do |items|
      items.each do |item|
        # Find the category
        category = category_table[item[:default_category]]    
        item.merge!(default_category: category)
  
        # Create the item
        new_item = DefaultItem.create(item.except(:image))       
        image_file_name = File.basename(item[:image], File.extname(item[:image]))   
                new_item.image_attachment.attach(io: image_files_hash[image_file_name], filename: item[:image])
      end
  
      # Sleep for a few seconds between batches
      sleep(sleep_time)
    end
  end
end
