class User < ApplicationRecord
  has_many :contracts
  has_many :watch_histories
  has_one :corporate

  validates :name, presence: true
end
