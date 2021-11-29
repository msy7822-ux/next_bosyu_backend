module Types
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :users, [Types::UserType], null: false, description: 'aquire all users'
    def users
      User.all
    end

    field :corporates, [Types::UserType], null: false, description: 'aquire all corporates'
    def corporates
      Corporate.all
    end

    field :user, Types::UserType, null: false do
      argument :id, ID, required: true
    end
    def user(id:)
      User.find(id)
    end
  end
end
