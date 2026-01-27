class CreateCredentials < ActiveRecord::Migration[8.1]
  def change
    create_table :credentials do |t|
      t.string :username
      t.string :password_hash
      t.text :source
      t.integer :operation_id

      t.timestamps
    end
  end
end
