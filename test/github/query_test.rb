require_relative '../test_helper'
require_relative '../../github'

module Github
  class ApiTest < Test::Unit::TestCase
    def test_query
      result = Github::Api::Client.query(
        Github::Query,
        variables: {
          query: "language:Ruby sort:updated",
          limit: 1
        }
      )

      assert_kind_of GraphQL::Client::Response, result
    end
  end
end
