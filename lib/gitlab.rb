require 'http'
require_relative "repository"

module GitlabApi
  API_ENDPOINT = 'https://gitlab.com/api/v4'
  LIMIT = 1

  def self.get_repositories(language = 'Ruby')
    response = HTTP.get("#{API_ENDPOINT}/projects?with_programming_language=#{language}&order_by=updated_at&per_page=#{LIMIT}")

    response.parse.collect do |project|
      Repository.from_gitlab(project)
    end
  end
end
