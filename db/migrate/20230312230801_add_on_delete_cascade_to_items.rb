class AddOnDeleteCascadeToItems < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :items, :users
    add_foreign_key :items, :users, on_delete: :cascade
  end
end
