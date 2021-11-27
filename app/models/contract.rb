class Contract < ApplicationRecord
  belongs_to :user
  belongs_to :corporate
  belongs_to :job_offer_slip
end
