module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :stories, [Types::StoryType], null: false
    def stories
      Story.all
    end

    field :story, Types::StoryType, null: false do
      argument :id, ID, required: true
    end
    def story(id:)
      Story.find(id)
    end
  end
end
