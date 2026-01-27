class CreateFindings < ActiveRecord::Migration[8.1]
  def change
    create_table :findings do |t|
      t.text :title
      t.text :severity
      t.text :description
      t.integer :operation_id
      t.integer :target_id

      t.timestamps
    end
  end
end
