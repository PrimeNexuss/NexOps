class AddMissingForeignKeys < ActiveRecord::Migration[8.1]
  def change
    add_foreign_key :targets, :operations
    add_foreign_key :findings, :operations
    add_foreign_key :findings, :targets
    add_foreign_key :evidences, :findings
    add_foreign_key :reports, :operations
    add_foreign_key :credentials, :operations
  end
end
