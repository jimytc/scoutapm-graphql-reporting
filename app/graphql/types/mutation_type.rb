# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :update_post, mutation: Mutations::UpdatePostMutation
    field :update_comment, mutation: Mutations::UpdateCommentMutation
    field :update_author, mutation: Mutations::UpdateAuthorMutation
  end
end
