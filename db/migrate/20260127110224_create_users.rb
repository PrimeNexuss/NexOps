class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.text :role
      t.text :name
      t.string :email

      t.timestamps
    end
  end
end
