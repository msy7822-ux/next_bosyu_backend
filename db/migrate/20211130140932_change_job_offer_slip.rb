class ChangeJobOfferSlip < ActiveRecord::Migration[6.1]
  def change
    remove_column :job_offer_slips, :context, null: false
    remove_column :job_offer_slips, :displayed, null: false
    add_column :job_offer_slips, :content, :text, null: false
    add_column :job_offer_slips, :displayed, :boolean, null: false, default: true
  end
end
