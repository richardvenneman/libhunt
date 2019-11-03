require_relative "github/api"
require_relative "github/query"

module Github
  def self.normalize_response(response)
    response["data"]["search"]["edges"].collect do |edge|
      edge["node"].slice("url", "name", "description").merge(
        "author" => edge["node"]["owner"]["login"],
        "source" => "GitHub"
      )
    end
  end
end
