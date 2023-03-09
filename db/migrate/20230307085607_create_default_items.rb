class CreateDefaultItems < ActiveRecord::Migration[7.0]
  def change
    create_table :default_items do |t|
      t.string :name
      t.string :note
      t.text :image
      t.references :default_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
