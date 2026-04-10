class CreateCampaigns < ActiveRecord::Migration[8.1]
  def change
    create_table :campaigns do |t|
      t.string :name
      t.text :description
      t.integer :status
      t.date :start_date
      t.date :end_date
      t.references :operator, null: false, foreign_key: true

      t.timestamps
    end
  end
end
