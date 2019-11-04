# frozen_string_literal: true

require_relative 'repository'

class GithubRepository < Repository
  def initialize(data)
    @url = data['url']
    @name = data['name']
    @description = data['description']
    @author = data['owner']['login']
    @updated_at = DateTime.parse(data['updatedAt'])
    @source = 'GitHub'
  end
end
