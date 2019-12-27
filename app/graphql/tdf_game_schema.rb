# frozen_string_literal: true

class TdfGameSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)
end
