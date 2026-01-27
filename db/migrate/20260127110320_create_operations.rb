class CreateOperations < ActiveRecord::Migration[8.1]
  def change
    create_table :operations do |t|
      t.text :name
      t.text :scope
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
