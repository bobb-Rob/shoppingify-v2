class CreateLists < ActiveRecord::Migration[7.0]
  def change
    create_table :lists do |t|
      t.string :name
      t.string :status, default: 'active'

      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
