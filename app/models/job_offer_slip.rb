class JobOfferSlip < ApplicationRecord
  belongs_to :corporate
  has_many :watch_histories
  has_many :contracts
end
