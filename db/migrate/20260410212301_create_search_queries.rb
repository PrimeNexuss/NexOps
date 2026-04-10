class CreateSearchQueries < ActiveRecord::Migration[8.1]
  def change
    create_table :search_queries do |t|
      t.references :user, null: false, foreign_key: true
      t.string :query
      t.text :filters
      t.string :search_type

      t.timestamps
    end
  end
end
