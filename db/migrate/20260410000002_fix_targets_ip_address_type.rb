class FixTargetsIpAddressType < ActiveRecord::Migration[8.1]
  def change
    change_column :targets, :ip_address, :string
  end
end
