module Types
  class QueryType < Types::BaseObject
    field :posts, PostType.connection_type, null: false
    field :comments, CommentType.connection_type, null: false
    field :authors, AuthorType.connection_type, null: false

    def posts
      %i[first second third].map { |title| Post.new(title) }
    end

    def comments
      Array.new(20) { Comment.new(SecureRandom.hex ) }
    end

    def authors
      ['Paul', 'J.K. Rollin', 'Gerald Weinberg', 'Michael C. Feathers'].map do |name|
        Author.new(name)
      end
    end
  end
end
