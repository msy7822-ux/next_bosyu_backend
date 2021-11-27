class CreateWatchHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :watch_histories do |t|
      t.references :user, foreign_key: true
      t.references :job_offer_slip, foreign_key: true
      t.timestamps
    end

    add_index :watch_histories, %I[user_id job_offer_slip_id], unique: true
  end
end
