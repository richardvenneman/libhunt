require "rake/testtask"

task default: "test"

Rake::TestTask.new do |task|
 task.pattern = "test/**/*_test.rb"
end

task "graphql:dump_schemas" do
  require_relative "github"

  GraphQL::Client.dump_schema(Github::Api::HTTP, Github::Api::SCHEMA_PATH)

  puts "Succesfully dumped GitHub API schema"
end
