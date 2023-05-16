# import default categories from /config/initializers/default_categories.rb
require_relative '../../config/initializers/default_categories.rb'

class AddDefaultCategoriesToDefaultCategoryModel < ActiveRecord::Migration[7.0]
  def change
    DefaultCategory.create(DEFAULT_CATEGORIES)
  end
end
