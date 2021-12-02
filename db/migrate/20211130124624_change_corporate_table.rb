class ChangeCorporateTable < ActiveRecord::Migration[6.1]
  def change
    remove_column :corporates, :name, :string
    remove_index :corporates, :email
    remove_column :corporates, :email, :string
    remove_column :corporates, :login_way, :integer

    add_reference :corporates, :user, foreign_key: true
  end
end
