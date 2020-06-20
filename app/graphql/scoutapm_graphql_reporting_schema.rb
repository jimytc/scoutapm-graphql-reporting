# frozen_string_literal: true

class ScoutapmGraphqlReportingSchema < GraphQL::Schema
  query(Types::QueryType)
  mutation(Types::MutationType)

  # Opt in to the new runtime (default in future graphql-ruby versions)
  use GraphQL::Execution::Interpreter
  use GraphQL::Analysis::AST

  if ENV['ENABLE_GRAPHQL_SCOUT']
    Rails.logger.info('[Scout] Use GraphQL::Tracing::ScoutTracing')
    if ENV['ENABLE_GRAPHQL_RENAME']
      Rails.logger.info('[Scout][GraphQL::Tracing::ScoutTracing] set_transaction_name = true')
      use GraphQL::Tracing::ScoutTracing, set_transaction_name: true
    else
      Rails.logger.info('[Scout][GraphQL::Tracing::ScoutTracing] set_transaction_name = nil')
      use GraphQL::Tracing::ScoutTracing
    end
  else
    Rails.logger.info('[Scout] Default Rails integration')
  end

  # Add built-in connections for pagination
  use GraphQL::Pagination::Connections
end
