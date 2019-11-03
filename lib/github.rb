require "graphql/client"
require "graphql/client/http"
require_relative "repository"

module GithubApi
  API_ENDPOINT = 'https://api.github.com/graphql'
  ACCESS_TOKEN = 'b6b745e87a6eccf3abe963cf345f289a0e16a0ff'
  SCHEMA_PATH = 'tmp/schemas/github.json'
  LIMIT = 1

  HTTP = GraphQL::Client::HTTP.new(API_ENDPOINT) do
    def headers(context)
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

    response.to_h["data"]["search"]["edges"].collect do |edge|
      Repository.from_github(edge["node"])
    end
  end
end
