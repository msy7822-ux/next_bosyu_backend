module Types
  class MutationType < Types::BaseObject
    field :create_job_offer_slip, mutation: Mutations::CreateJobOfferSlip
    # field :createJobOfferSlip, mutation: Mutations::CreateJobOfferSlip
  end
end
