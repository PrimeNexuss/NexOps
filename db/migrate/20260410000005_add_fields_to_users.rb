class AddFieldsToUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :terms_accepted, :boolean, default: false
    add_column :users, :newsletter_subscribed, :boolean, default: false
  end
end
