module Types
  class MutationType < Types::BaseObject
    field :undisplay_offer, mutation: Mutations::UndisplayOffer
    field :create_job_offer_slip, mutation: Mutations::CreateJobOfferSlip
  end
end
