class AddUserIdToOperations < ActiveRecord::Migration[8.1]
  def change
    add_reference :operations, :user, null: false, foreign_key: true
  end
end
