class ChangeUsersTable < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :login_way
    remove_column :users, :first_name
    remove_column :users, :last_name
    remove_column :users, :password_digest
    change_column_null :users, :email, false
    add_column :users, :name, :string, null: false
    add_column :users, :imageUrl, :text
  end
end
