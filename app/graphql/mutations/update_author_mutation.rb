# frozen_string_literal: true

module Mutations
  class UpdateAuthorMutation < BaseMutation
    argument :name, String, required: true
    argument :age, Integer, required: true

    field :author, ::Types::AuthorType, null: false

    def resolve(name:, age:)
      {
        author: Author.new(name).tap { |a| a.age = age }
      }
    end
  end
end
