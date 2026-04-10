class CreateReports < ActiveRecord::Migration[8.1]
  def change
    create_table :reports do |t|
      t.integer :operation_id
      t.date :generated_at

      t.timestamps
    end
  end
end
