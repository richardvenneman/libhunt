require_relative 'test_helper'
require_relative '../github'

class GithubTest < Test::Unit::TestCase
  def test_normalize_response
    normalized_response = [
      {
        "url" => "https://github.com/KristinHannah/puppy_love",
        "name" => "puppy_love",
        "description" => "rails project to match users with dog breeds",
        "author" => "KristinHannah",
        "source" => "GitHub"
      }
    ]

    assert_equal normalized_response, Github.normalize_response(query_stub)
  end

  private

  def query_stub
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
end
