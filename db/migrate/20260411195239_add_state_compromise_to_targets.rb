class AddStateCompromiseToTargets < ActiveRecord::Migration[8.1]
  def change
    add_column :targets, :state_compromise, :boolean
    add_column :targets, :default, :string
    add_column :targets, :false, :string
  end
end
