# frozen_string_literal: true

require 'graphql/client'
require 'graphql/client/http'
require_relative '../models/github_repository'
require_relative 'timeout_error'

module GithubApi
  API_ENDPOINT = 'https://api.github.com/graphql'
  ACCESS_TOKEN = 'b6b745e87a6eccf3abe963cf345f289a0e16a0ff'
  SCHEMA_PATH = 'tmp/schemas/github.json'
  TIMEOUT = 30
  LIMIT = 50

  HTTP = GraphQL::Client::HTTP.new(API_ENDPOINT) do
    def connection
      super.tap do |connection|
        connection.read_timeout = TIMEOUT
      end
    end

    def headers(_context)
      { "Authorization": "bearer #{ACCESS_TOKEN}" }
    end
  end

  Schema = GraphQL::Client.load_schema(SCHEMA_PATH)
  Client = GraphQL::Client.new(schema: Schema, execute: HTTP)
  Query = GithubApi::Client.parse <<-'GRAPHQL'
    query($query: String!, $limit: Int!) {
      search(query: $query, type: REPOSITORY, first: $limit) {
        edges {
          node {
            ... on Repository {
              url
              name
              description
              owner {
                login
              }
              updatedAt
            }
          }
        }
      }
    }
  GRAPHQL

  def self.get_repositories(language = 'Ruby')
    response = Client.query(
      Query,
      variables: {
        query: "language:#{language} sort:updated-desc",
        limit: LIMIT
      }
    )

    response.to_h['data']['search']['edges'].collect do |edge|
      GithubRepository.new(edge['node'])
    end
  rescue Net::ReadTimeout
    raise ApiTimeoutError
  end
end
