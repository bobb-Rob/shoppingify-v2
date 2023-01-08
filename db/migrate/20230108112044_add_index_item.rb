class AddIndexItem < ActiveRecord::Migration[7.0]
  def change
    add_index :items, :name, unique: true
  end
end
