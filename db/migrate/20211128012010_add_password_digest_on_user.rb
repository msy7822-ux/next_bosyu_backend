class AddPasswordDigestOnUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :password, :text
  end
end
