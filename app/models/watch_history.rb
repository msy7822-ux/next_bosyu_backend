class WatchHistory < ApplicationRecord
  belongs_to :user
  belongs_to :job_offer_slip
end
