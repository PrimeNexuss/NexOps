class CreateOperators < ActiveRecord::Migration[8.1]
  def change
    create_table :operators do |t|
      t.string :name
      t.string :email
      t.string :username

      t.timestamps
    end
  end
end
