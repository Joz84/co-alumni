class AddFieldsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :role, :integer
    add_column :users, :score, :integer
    add_column :users, :country, :string
    add_column :users, :token, :string
    add_column :users, :coordinator_id, :integer
  end
end
