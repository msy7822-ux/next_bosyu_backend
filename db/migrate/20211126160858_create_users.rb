class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, index: { unique: true }
      t.integer :login_way, null: false, default: 0

      t.timestamps
    end
  end
end
