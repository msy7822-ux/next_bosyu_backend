class RemovePostingPeriodColumn < ActiveRecord::Migration[6.1]
  def change
    remove_column :job_offer_slips, :posting_period
  end
end
