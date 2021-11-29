module Types
  class JobOfferSlipType < Types::BaseObject
    field :id, ID, null: false
    field :corporate_id, Integer, null: true
    field :job_category, String, null: false
    field :job_detail, String, null: false
    field :reward, Integer, null: false
    field :tag, String, null: true
    field :posting_period, GraphQL::Types::ISO8601Date, null: false
    field :displayed, Boolean, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
