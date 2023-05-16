class AddOnDeleteCascadeToLists < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :lists, :users
    add_foreign_key :lists, :users, on_delete: :cascade
  end
end
