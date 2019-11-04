# frozen_string_literal: true

require 'http'
require_relative 'repository'
require_relative 'api_timeout_error'

module GitlabApi
  API_ENDPOINT = 'https://gitlab.com/api/v4'
  TIMEOUT = 30
  LIMIT = 50

  def self.get_repositories(language = 'Ruby')
    response = HTTP.timeout(read: TIMEOUT)
                   .get("#{API_ENDPOINT}/projects?with_programming_language=#{language}&order_by=updated_at&per_page=#{LIMIT}")

    response.parse.collect do |project|
      Repository.from_gitlab(project)
    end
  rescue HTTP::TimeoutError
    raise ApiTimeoutError
  end
end
