# frozen_string_literal: true

module Mutations
  class UpdateCommentMutation < BaseMutation
    argument :body, String, required: true

    field :comment, ::Types::CommentType, null: false

    def resolve(body:)
      {
        comment: Comment.new(body)
      }
    end
  end
end
