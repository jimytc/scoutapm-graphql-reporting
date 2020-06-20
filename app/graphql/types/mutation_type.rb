# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :update_post, mutation: Mutations::UpdatePostMutation
  end
end
