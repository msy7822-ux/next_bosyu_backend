module Types
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :users, [Types::UserType], null: true, description: 'aquire all users'
    def users
      User.all
    end

    field :user, Types::UserType, null: true do
      argument :token, String, required: true
    end
    def user(token:)
      User.eager_load(corporate: :job_offer_slips).find_by(token: token)
    end

    # field :search_job_offer_slips, Types::JobOfferSlipType.connection_type, null: true do
    field :search_job_offer_slips, [Types::JobOfferSlipType], null: true do
      argument :keyword, String, required: false
    end
    def search_job_offer_slips(keyword:)
      JobOfferSlip.eager_load(corporate: :user).where('job_offer_slips.tag like ?', "%##{keyword}%").or(JobOfferSlip.eager_load(corporate: :user).where('job_offer_slips.title like ?', "%#{keyword}%").or(JobOfferSlip.eager_load(corporate: :user).where('job_offer_slips.content like ?', "%#{keyword}%")))
    end

    # field :job_offer_slips, [Types::JobOfferSlipType], null: false
    field :job_offer_slips, Types::JobOfferSlipType.connection_type, null: true
    def job_offer_slips
      # JobOfferSlip.all -> N+1発生
      # 下記ではN+1は発生せず
      JobOfferSlip.eager_load(corporate: :user).all.reverse
    end
  end
end
