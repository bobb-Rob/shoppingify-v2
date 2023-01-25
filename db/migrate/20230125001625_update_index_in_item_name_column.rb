class UpdateIndexInItemNameColumn < ActiveRecord::Migration[7.0]
  def change
    remove_index :items, name: "index_items_on_name"
    add_index :items, [:user_id, :name], :unique => true
  end
end
