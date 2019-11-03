module Gitlab
  def self.normalize_response(response)
    response.collect do |project|
      project.slice("name", "description").merge(
        "url" => project["web_url"],
        "author" => project["namespace"]["path"],
        "source" => "GitLab"
      )
    end
  end
end
