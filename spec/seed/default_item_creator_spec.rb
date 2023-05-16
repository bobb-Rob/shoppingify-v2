require_relative '../../config/initializers/default_item_creator.rb'

RSpec.describe DefaultItemCreator do
  describe '.read_image_files' do
    before(:all) do
      @image_path = 'spec/fixtures/images'
      @result_hash = described_class.read_image_files(@image_path)
    end

    it 'returns a hash' do
      expect(@result_hash).to be_a(Hash)
    end

    it 'returns a non-empty hash' do
      expect(@result_hash).not_to be_empty
    end

    it 'returns a hash with all file names as keys' do
      expect(@result_hash.keys).to contain_exactly('Apple1', 'Banana1')
    end

    it 'returns a hash with File objects as values' do
      expect(@result_hash['Apple1']).to be_an_instance_of(File)
      expect(@result_hash['Banana1']).to be_an_instance_of(File)
    end    
  end 

  # describe '.process_item_batch' do
  #   it 'processes a batch of items and attaches the corresponding image file' do
  #     category = create(:default_category, name: 'Fruit')
  #     image_path = 'spec/fixtures/images' # directory with test images
  #     image_files_hash = described_class.read_image_files(image_path)
  #     category_table = { 'Fruit' => category }
  #     items = [
  #       { name: 'Apple', default_category: 'Fruit', image: 'Apple1.jpg' },
  #       { name: 'Banana', default_category: 'Fruit', image: 'Banana1.jpg' }
  #     ]

  #     described_class.process_item_batch(items, category_table, image_files_hash)

  #     apple = category.default_items.find_by(name: 'Apple')
  #     banana = category.default_items.find_by(name: 'Banana')

  #     expect(apple).to be_a(DefaultItem)
  #     expect(banana).to be_a(DefaultItem)
  #     expect(apple.image).to be_attached
  #     expect(banana.image).to be_attached
  #   end
  # end

  # describe '.create_default_items' do
  #   it 'creates default items based on a batch size and sleep time' do
  #     category = create(:default_category, name: 'Fruit')
  #     image_path = 'spec/fixtures/images' # directory with test images
  #     batch_size = 1
  #     sleep_time = 0 # no sleeping, for testing purposes
  #     items = [
  #       { name: 'Apple', default_category: 'Fruit', image: 'Apple1.jpg' },
  #       { name: 'Banana', default_category: 'Fruit', image: 'Banana1.jpg' }
  #     ]
      
  #     allow(described_class).to receive(:read_image_files).and_return({ 'Apple1' => instance_of(File), 'Banana1' => instance_of(File) })
  #     allow(described_class).to receive(:find_categories_by_name).and_return({ 'Fruit' => category })
  #     allow(described_class).to receive(:process_item_batch)
      
  #     described_class.create_default_items(image_path, batch_size, sleep_time)

  #     expect(described_class).to have_received(:read_image_files).with(image_path).once
  #     expect(described_class).to have_received(:find_categories_by_name).with([ 'Fruit' ]).once
  #     expect(described_class).to have_received(:process_item_batch).with(items, { 'Fruit' => category }, { 'Apple1' => instance_of(File), 'Banana1' => instance_of(File) }).twice
  #   end
  # end
end