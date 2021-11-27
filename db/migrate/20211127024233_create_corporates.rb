class CreateCorporates < ActiveRecord::Migration[6.1]
  def change
    create_table :corporates do |t|
      t.string :name, null: false
      t.string :email, index: { unique: true }
      t.integer :login_way, null: false

      t.timestamps
    end
  end
end
