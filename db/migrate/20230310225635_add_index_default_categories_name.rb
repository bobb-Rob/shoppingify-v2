class AddIndexDefaultCategoriesName < ActiveRecord::Migration[7.0]
  def change
    add_index :default_categories, :name 
  end
end
