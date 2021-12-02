class AddAccessTokentoUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :token, :string, null: false
  end
end
