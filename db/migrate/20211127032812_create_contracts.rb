class CreateContracts < ActiveRecord::Migration[6.1]
  def change
    create_table :contracts do |t|
      t.references :user, foreign_key: true
      t.references :corporate, foreign_key: true
      t.references :job_offer_slip, foreign_key: true

      t.timestamps
    end

    add_index :contracts, %I[user_id corporate_id job_offer_slip_id], unique: true, name: 'contract_index'
  end
end
