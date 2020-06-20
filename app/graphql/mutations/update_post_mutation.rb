# frozen_string_literal: true

module Mutations
  class UpdatePostMutation < BaseMutation
    argument :title, String, required: true

    field :post, ::Types::PostType, null: false

    def resolve(title:)
      {
        post: Post.new(title)
      }
    end
  end
end
