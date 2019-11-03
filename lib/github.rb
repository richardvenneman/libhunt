require "graphql/client"
require "graphql/client/http"

module GithubApi
  API_ENDPOINT = 'https://api.github.com/graphql'
  ACCESS_TOKEN = 'b6b745e87a6eccf3abe963cf345f289a0e16a0ff'
  SCHEMA_PATH = 'tmp/schemas/github.json'

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
end
