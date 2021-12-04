module Types
  class JobOfferSlipType < Types::BaseObject
    field :id, ID, null: false
    field :corporate, Types::CorporateType, null: false
    field :content, String, null: false
    field :title, String, null: false
    field :tag, String
    field :logined, Boolean, null: false
    field :token, String, null: false
    field :displayed, Boolean, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
