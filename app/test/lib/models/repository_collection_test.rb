# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../../../lib/apis/github_api'
require_relative '../../../lib/apis/gitlab_api'
require_relative '../../../lib/models/repository_collection'

class RepositoryCollectionTest < Minitest::Test
  def test_sorted
    github_repositories = GithubApi.get_repositories('Ruby')
    gitlab_repositories = GitlabApi.get_repositories('Ruby')
    list = RepositoryCollection.new(github_repositories, gitlab_repositories).sorted

    assert_kind_of Hash, list.first
    assert list.first[:updated_at] > list.last[:updated_at]
  end
end
