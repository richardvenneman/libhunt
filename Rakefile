task "graphql:dump_schemas" do
  require_relative "graphql/clients/github_client"

  GraphQL::Client.dump_schema(GHAPI::HTTP, GHAPI::SCHEMA_PATH)

  puts "Succesfully dumped GitHub API schema"
end
