class ChangeJobOfferSlipTable < ActiveRecord::Migration[6.1]
  def change
    remove_column :job_offer_slips, :job_category, :string
    remove_column :job_offer_slips, :job_detail, :text
    remove_column :job_offer_slips, :reward, :integer
    add_column :job_offer_slips, :title, :string, null: false
    add_column :job_offer_slips, :context, :text, null: false
  end
end
