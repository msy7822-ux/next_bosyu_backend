module Mutations
  class UndisplayOffer < BaseMutation
    field :job_offer_slip, Types::JobOfferSlipType, null: false
    argument :id, ID, required: true

    def resolve(id:)
      offer = JobOfferSlip.find(id)
      offer.displayed = false
      offer.save!

      { job_offer_slip: offer }
    end
  end
end
