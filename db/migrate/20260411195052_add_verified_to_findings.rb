class AddVerifiedToFindings < ActiveRecord::Migration[8.1]
  def change
    add_column :findings, :verified, :boolean
    add_column :findings, :default, :string
    add_column :findings, :false, :string
  end
end
