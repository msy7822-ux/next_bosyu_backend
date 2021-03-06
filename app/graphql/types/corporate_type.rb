module Types
  class CorporateType < Types::BaseObject
    field :id, ID, null: false
    field :user, Types::UserType, null: false
    field :job_offer_slips, [Types::JobOfferSlipType], null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
