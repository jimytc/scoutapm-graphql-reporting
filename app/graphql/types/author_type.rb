module Types
  class AuthorType < Types::BaseObject
    field :name, String, null: true
    field :age, Integer, null: true
  end
end
