require_relative '../test_helper'
require_relative '../../lib/github'

class GithubApiTest < Test::Unit::TestCase
  def test_client
    assert_kind_of GraphQL::Client, GithubApi::Client
  end

  def test_query
    result = GithubApi::Client.query(
      GithubApi::Query,
      variables: {
        query: "language:Ruby sort:updated-desc",
        limit: 1
      }
    )

    assert_kind_of GraphQL::Client::Response, result
  end
end
