module Helpers
  def normalize_github_response(response)
    response["data"]["search"]["edges"].collect do |edge|
      edge["node"].slice("url", "name", "description").merge(
        "author" => edge["node"]["owner"]["login"],
        "source" => "GitHub"
      )
    end
  end

  def normalize_gitlab_response(response)
    response.collect do |project|
      project.slice("name", "description").merge(
        "url" => project["web_url"],
        "author" => project["namespace"]["path"],
        "source" => "GitLab"
      )
    end
  end
end
