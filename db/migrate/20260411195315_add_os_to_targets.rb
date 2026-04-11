class AddOsToTargets < ActiveRecord::Migration[8.1]
  def change
    add_column :targets, :os, :string
  end
end
