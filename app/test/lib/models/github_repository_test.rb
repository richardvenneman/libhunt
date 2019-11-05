# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../../../lib/models/github_repository'

class GithubRepositoryTest < Minitest::Test
  def test_attributes
    repository = GithubRepository.new(data)

    assert_equal 'https://github.com/KristinHannah/puppy_love', repository.url
    assert_equal 'puppy_love', repository.name
    assert_equal 'rails project to match users with dog breeds', repository.description
    assert_equal 'KristinHannah', repository.author
    assert_equal DateTime.parse('2019-11-03T20:30:30.187Z'), repository.updated_at
    assert_equal 'GitHub', repository.source
  end

  def test_to_h
    repository = GithubRepository.new(data)
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

  def data
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
end
