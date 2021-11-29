module Types
  class WatchHistoryType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, Integer, null: true
    field :job_offer_slip_id, Integer, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
