require_relative '../test_helper'
require_relative '../../lib/helpers'

class HelpersTest < Test::Unit::TestCase
  include Helpers

  def test_normalize_github_response
    expected = [
      {
        "url" => "https://github.com/KristinHannah/puppy_love",
        "name" => "puppy_love",
        "description" => "rails project to match users with dog breeds",
        "author" => "KristinHannah",
        "source" => "GitHub"
      }
    ]

    assert_equal expected, normalize_github_response(github_query_stub)
  end

  def test_normalize_gitlab_response
    normalized_response = [
      {
        "url" => "https://gitlab.com/mlaPassau/gp-test-2230",
        "name" => "gp-test-2230",
        "description" => "ML exp project",
        "author" => "mlaPassau",
        "source" => "GitLab"
      }
    ]

    assert_equal normalized_response, normalize_gitlab_response(query_stub)
  end

  private

  def github_query_stub
    {
      "data" => {
        "search" => {
          "edges" => [
            {
              "node" => {
                "__typename" => "Repository",
                "url" => "https://github.com/KristinHannah/puppy_love",
                "name" => "puppy_love",
                "description" => "rails project to match users with dog breeds",
                "owner" => {
                  "__typename" => "User",
                  "login" => "KristinHannah"
                }
              }
            }
          ]
        }
      }
    }
  end

  def gitlab_query_stub
    [
      {
        "id" => 15154344,
        "description" => "ML exp project",
        "name" => "gp-test-2230",
        "name_with_namespace" => "Madan Lal / gp-test-2230",
        "path" => "gp-test-2230",
        "path_with_namespace" => "mlaPassau/gp-test-2230",
        "created_at" => "2019-11-03T21:30:31.887Z",
        "default_branch" => "master",
        "tag_list" => [],
        "ssh_url_to_repo" => "git@gitlab.com:mlaPassau/gp-test-2230.git",
        "http_url_to_repo" => "https://gitlab.com/mlaPassau/gp-test-2230.git",
        "web_url" => "https://gitlab.com/mlaPassau/gp-test-2230",
        "readme_url" => "https://gitlab.com/mlaPassau/gp-test-2230/blob/master/Readme.md",
        "avatar_url" => nil,
        "star_count" => 0,
        "forks_count" => 0,
        "last_activity_at" => "2019-11-03T21:30:31.887Z",
        "namespace" => {
          "id" => 5823977,
          "name" => "Madan Lal",
          "path" => "mlaPassau",
          "kind" => "user",
          "full_path" => "mlaPassau",
          "parent_id" => nil,
          "avatar_url" => "https://secure.gravatar.com/avatar/a84c1a0ec062b3d2e149c9ca304dc8e5?s=80&d=identicon",
          "web_url" => "https://gitlab.com/mlaPassau"
        }
      }
    ]
  end
end
