class Corporate < ApplicationRecord
  has_many :contracts
  has_many :job_offer_slips
end
