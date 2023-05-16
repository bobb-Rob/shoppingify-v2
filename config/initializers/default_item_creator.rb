require_relative './default_categories.rb'
require_relative './default_items.rb'

class DefaultItemCreator
  def self.read_image_files(image_path)
    image_files_hash = {}
  
    Dir.entries(image_path).each do |file|
      next if File.directory?(file)
      file_name = File.basename(file, File.extname(file)).capitalize
      image_files_hash[file_name] = File.open(File.join(image_path, file))
    end
    puts "image_files_hash: #{image_files_hash}"
    image_files_hash
  end

  def self.find_categories_by_name(category_names)
    DefaultCategory.where(name: category_names).includes(:default_items).index_by(&:name)
  end

  def self.process_item_batch(items, category_table, image_files_hash)
    items.each do |item|
      # Find the category
      category = category_table[item[:default_category]]    
      item.merge!(default_category: category)
  
      # Create the item
      new_item = DefaultItem.create(item.except(:image))       
      image_file_name = File.basename(item[:image], File.extname(item[:image]))
      puts "image_file_name: #{image_file_name}"
      puts "image_files_hash: #{image_files_hash[image_file_name.capitalize]}"    
      new_item.image_attachment.attach(io: image_files_hash[image_file_name.capitalize], filename: item[:image])
    end
  end

  def self.create_default_items(image_path, batch_size, sleep_time)
    # Read all image files into memory using the image file name as the key
    image_files_hash = DefaultItemCreator.read_image_files(image_path)
    
    # Do bulk Categories find by name to avoid multiple queries
    category_names = DEFAULT_ITEMS.map { |item| item[:default_category] }.uniq
    category_table = DefaultItemCreator.find_categories_by_name(category_names)

    # Process items in batches
    DEFAULT_ITEMS.each_slice(batch_size) do |items|
      DefaultItemCreator.process_item_batch(items, category_table, image_files_hash)

      # Sleep for a few seconds between batches
      sleep(sleep_time)
    end
  end

end