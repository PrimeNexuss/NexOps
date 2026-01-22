class CreateHosts < ActiveRecord::Migration[8.1]
  def change
    create_table :hosts do |t|
      t.references :campaign, null: false, foreign_key: true
      t.string :ip_address
      t.string :hostname
      t.string :os
      t.integer :state_compromise
      t.text :notes
      t.datetime :discovered_at

      t.timestamps
    end
  end
end
