class AddTokenGeneratedDateToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :token_generation_date, :datetime
  end
end
