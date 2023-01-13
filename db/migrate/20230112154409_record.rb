class Record < ActiveRecord::Migration[7.0]
  def change
    add_column :records, :completed, :boolean, default: false
  end
end
