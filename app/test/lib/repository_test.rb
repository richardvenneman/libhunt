# frozen_string_literal: true

require_relative '../test_helper'
require_relative '../../lib/repository'

class RepositoryTest < Test::Unit::TestCase
  def test_from_github
    repository = Repository.from_github(github_repository)

    assert_kind_of Repository, repository
    assert_equal 'https://github.com/KristinHannah/puppy_love', repository.url
    assert_equal 'puppy_love', repository.name
    assert_equal 'rails project to match users with dog breeds', repository.description
    assert_equal 'KristinHannah', repository.author
    assert_equal DateTime.parse('2019-11-03T20:30:30.187Z'), repository.updated_at
    assert_equal 'GitHub', repository.source
  end

  def test_from_gitlab
    repository = Repository.from_gitlab(gitlab_project)

    assert_kind_of Repository, repository
    assert_equal 'https://gitlab.com/mlaPassau/gp-test-2230', repository.url
    assert_equal 'gp-test-2230', repository.name
    assert_equal 'ML exp project', repository.description
    assert_equal 'mlaPassau', repository.author
    assert_equal DateTime.parse('2019-11-03T21:30:31.887Z'), repository.updated_at
    assert_equal 'GitLab', repository.source
  end

  def test_to_h
    repository = Repository.from_github(github_repository)
    hash = {
      author: 'KristinHannah',
      description: 'rails project to match users with dog breeds',
      name: 'puppy_love',
      source: 'GitHub',
      updated_at: '2019-11-03T20:30:30.187+00:00',
      url: 'https://github.com/KristinHannah/puppy_love'
    }

    assert_equal(hash, repository.to_h)
  end

  private

  def github_repository
    {
      '__typename' => 'Repository',
      'url' => 'https://github.com/KristinHannah/puppy_love',
      'name' => 'puppy_love',
      'description' => 'rails project to match users with dog breeds',
      'owner' => {
        '__typename' => 'User',
        'login' => 'KristinHannah'
      },
      'updatedAt' => '2019-11-03T20:30:30.187Z'
    }
  end

  def gitlab_project
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
