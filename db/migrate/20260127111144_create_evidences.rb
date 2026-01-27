class CreateEvidences < ActiveRecord::Migration[8.1]
  def change
    create_table :evidences do |t|
      t.string :file_path
      t.integer :finding_id

      t.timestamps
    end
  end
end
