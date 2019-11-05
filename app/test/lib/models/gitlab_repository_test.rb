# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../../../lib/models/gitlab_repository'

class GitlabRepositoryTest < Minitest::Test
  def test_from_gitlab
    repository = GitlabRepository.new(data)

    assert_equal 'https://gitlab.com/mlaPassau/gp-test-2230', repository.url
    assert_equal 'gp-test-2230', repository.name
    assert_equal 'ML exp project', repository.description
    assert_equal 'mlaPassau', repository.author
    assert_equal DateTime.parse('2019-11-03T21:30:31.887Z'), repository.updated_at
    assert_equal 'GitLab', repository.source
  end

  def test_to_h
    repository = GitlabRepository.new(data)
    hash = {
      author: 'mlaPassau',
      description: 'ML exp project',
      name: 'gp-test-2230',
      source: 'GitLab',
      updated_at: '2019-11-03T21:30:31.887+00:00',
      url: 'https://gitlab.com/mlaPassau/gp-test-2230'
    }

    assert_equal(hash, repository.to_h)
  end

  private

  def data
    {
      'id' => 15_154_344,
      'description' => 'ML exp project',
      'name' => 'gp-test-2230',
      'name_with_namespace' => 'Madan Lal / gp-test-2230',
      'path' => 'gp-test-2230',
      'path_with_namespace' => 'mlaPassau/gp-test-2230',
      'created_at' => '2019-11-03T21:30:31.887Z',
      'default_branch' => 'master',
      'tag_list' => [],
      'ssh_url_to_repo' => 'git@gitlab.com:mlaPassau/gp-test-2230.git',
      'http_url_to_repo' => 'https://gitlab.com/mlaPassau/gp-test-2230.git',
      'web_url' => 'https://gitlab.com/mlaPassau/gp-test-2230',
      'readme_url' => 'https://gitlab.com/mlaPassau/gp-test-2230/blob/master/Readme.md',
      'avatar_url' => nil,
      'star_count' => 0,
      'forks_count' => 0,
      'last_activity_at' => '2019-11-03T21:30:31.887Z',
      'namespace' => {
        'id' => 5_823_977,
        'name' => 'Madan Lal',
        'path' => 'mlaPassau',
        'kind' => 'user',
        'full_path' => 'mlaPassau',
        'parent_id' => nil,
        'avatar_url' => 'https://secure.gravatar.com/avatar/a84c1a0ec062b3d2e149c9ca304dc8e5?s=80&d=identicon',
        'web_url' => 'https://gitlab.com/mlaPassau'
      }
    }
  end
end
