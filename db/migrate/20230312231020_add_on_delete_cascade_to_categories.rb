class AddOnDeleteCascadeToCategories < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :categories, :users
    add_foreign_key :categories, :users, on_delete: :cascade
  end
end
