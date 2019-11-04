require_relative '../test_helper'
require_relative '../../lib/github'
require_relative '../../lib/gitlab'
require_relative '../../lib/repository_collection'

class RepositoryCollectionTest < Test::Unit::TestCase
  def test_sorted
    github_repositories = GithubApi.get_repositories("Ruby")
    gitlab_repositories = GitlabApi.get_repositories("Ruby")
    list = RepositoryCollection.new(github_repositories + gitlab_repositories).sorted

    assert_kind_of Hash, list.first
    assert_true list.first[:updated_at] > list.last[:updated_at]
  end
end
