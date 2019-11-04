# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../../../lib/apis/gitlab_api'

class GitlabApiTest < Test::Unit::TestCase
  def test_get_repositories
    response = GitlabApi.get_repositories

    assert_kind_of Array, response
    assert_kind_of Repository, response[0]
  end
end
