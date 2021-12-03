module Types
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :users, [Types::UserType], null: false, description: 'aquire all users'
    def users
      User.all
    end

    field :user, Types::UserType, null: false do
      argument :id, ID, required: true
    end
    def user(id:)
      User.find(id)
    end

    # field :job_offer_slips, [Types::JobOfferSlipType], null: false
    field :job_offer_slips, Types::JobOfferSlipType.connection_type, null: false
    def job_offer_slips
      # JobOfferSlip.all -> N+1発生
      # 下記ではN+1は発生せず
      JobOfferSlip.eager_load(corporate: :user).all
    end
  end
end
