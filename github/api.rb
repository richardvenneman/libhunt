require "graphql/client"
require "graphql/client/http"

GITHUB_API_ENDPOINT = 'https://api.github.com/graphql'
GITHUB_ACCESS_TOKEN = 'b6b745e87a6eccf3abe963cf345f289a0e16a0ff'

module Github
  module Api
    SCHEMA_PATH = 'tmp/schemas/github.json'

    HTTP = GraphQL::Client::HTTP.new(GITHUB_API_ENDPOINT) do
      def headers(context)
        { "Authorization": "bearer #{GITHUB_ACCESS_TOKEN}" }
      end
    end

    Schema = GraphQL::Client.load_schema(SCHEMA_PATH)
    Client = GraphQL::Client.new(schema: Schema, execute: HTTP)
  end
end
