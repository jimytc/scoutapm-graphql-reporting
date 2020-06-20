# frozen_string_literal: true

module Mutations
  class UpdateAuthorMutation < BaseMutation
    argument :name, String, required: true
    argument :age, Integer, required: false

    field :author, ::Types::AuthorType, null: false

    def resolve(name:, age: Random.rand(18..60))
      {
        author: Author.new(name).tap { |a| a.age = age }
      }
    end
  end
end
