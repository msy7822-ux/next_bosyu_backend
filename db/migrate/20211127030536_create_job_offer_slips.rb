class CreateJobOfferSlips < ActiveRecord::Migration[6.1]
  def change
    create_table :job_offer_slips do |t|
      t.references :corporate, foreign_key: true
      t.string :job_category, null: false
      t.text :job_detail, null: false
      t.integer :reward, null: false
      t.string :tag
      t.date :posting_period, null: false
      t.boolean :displayed, null: false

      t.timestamps
    end
  end
end
