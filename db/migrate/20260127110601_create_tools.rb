class CreateTools < ActiveRecord::Migration[8.1]
  def change
    create_table :tools do |t|
      t.text :name
      t.text :category
      t.text :description

      t.timestamps
    end
  end
end
