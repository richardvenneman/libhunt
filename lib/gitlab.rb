require 'http'

module Gitlab
  API_ENDPOINT = 'https://gitlab.com/api/v4'
  QUERY_LIMIT = 50

  def self.get_projects
    HTTP.get("#{Gitlab::API_ENDPOINT}/projects?order_by=updated_at&per_page=#{Gitlab::QUERY_LIMIT}")
  end
end
