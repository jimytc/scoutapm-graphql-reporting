module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :posts, PostType.connection_type, null: false

    def posts
      %i[first second third].map { |title| Post.new(title) }
    end
  end
end
