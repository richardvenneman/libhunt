# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../../../lib/apis/github_api'

class GithubApiTest < Minitest::Test
  def test_client
    assert_kind_of GraphQL::Client, GithubApi::Client
  end

  def test_query
    assert_kind_of GraphQL::Client::OperationDefinition, GithubApi::Query
  end

  def test_get_repositories
    response = GithubApi.get_repositories

    assert_kind_of Array, response
    assert_kind_of Repository, response[0]
  end
end
