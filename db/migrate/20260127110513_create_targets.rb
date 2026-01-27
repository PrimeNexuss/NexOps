class CreateTargets < ActiveRecord::Migration[8.1]
  def change
    create_table :targets do |t|
      t.integer :ip_address
      t.string :host_name
      t.integer :operation_id

      t.timestamps
    end
  end
end
