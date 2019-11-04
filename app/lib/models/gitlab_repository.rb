# frozen_string_literal: true

require_relative 'repository'

class GitlabRepository < Repository
  def initialize(data)
    @url = data['web_url']
    @name = data['name']
    @description = data['description']
    @author = data['namespace']['path']
    @updated_at = DateTime.parse(data['last_activity_at'])
    @source = 'GitLab'
  end
end
