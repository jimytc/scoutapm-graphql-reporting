# frozen_string_literal: true

class ScoutapmGraphqlReportingSchema < GraphQL::Schema
  query(Types::QueryType)
  mutation(Types::MutationType)

  # Opt in to the new runtime (default in future graphql-ruby versions)
  use GraphQL::Execution::Interpreter
  use GraphQL::Analysis::AST

  Rails.logger.debug("ENV['ENABLE_GRAPHQL_SCOUT'] = #{ENV['ENABLE_GRAPHQL_SCOUT']}")
  Rails.logger.debug("ENV['ENABLE_GRAPHQL_RENAME'] = #{ENV['ENABLE_GRAPHQL_RENAME']}")
  if ENV['ENABLE_GRAPHQL_SCOUT']
    puts('[Scout] Use GraphQL::Tracing::ScoutTracing')
    if ENV['ENABLE_GRAPHQL_RENAME']
      puts('[Scout][GraphQL::Tracing::ScoutTracing] set_transaction_name = true')
      use GraphQL::Tracing::ScoutTracing, set_transaction_name: true
    else
      puts('[Scout][GraphQL::Tracing::ScoutTracing] set_transaction_name = nil')
      use GraphQL::Tracing::ScoutTracing
    end
  else
    puts('[Scout] Default Rails integration')
  end

  # Add built-in connections for pagination
  use GraphQL::Pagination::Connections
end
