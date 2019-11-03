require_relative '../test_helper'
require_relative '../../github/api'

module Github
  class ApiTest < Test::Unit::TestCase
    def test_client
      assert_kind_of GraphQL::Client, Github::Api::Client
    end
  end
end
