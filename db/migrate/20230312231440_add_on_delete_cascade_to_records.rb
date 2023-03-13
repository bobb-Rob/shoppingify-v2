class AddOnDeleteCascadeToRecords < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :records, :lists
    remove_foreign_key :records, :items
    add_foreign_key :records, :lists, on_delete: :cascade
    add_foreign_key :records, :items, on_delete: :cascade
  end
end
