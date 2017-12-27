class AddEmailToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :email_address, :string, index: true
  end
end
