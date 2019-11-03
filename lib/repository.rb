class Repository
  attr_accessor :url, :name, :description, :author, :source

  def initialize(url, name, description, author, source)
    @url = url
    @name = name
    @description = description
    @author = author
    @source = source
  end

  def self.from_github(data)
    new(
      data["url"],
      data["name"],
      data["description"],
      data["owner"]["login"],
      "GitHub"
    )
  end

  def self.from_gitlab(data)
    new(
      data["web_url"],
      data["name"],
      data["description"],
      data["namespace"]["path"],
      "GitLab"
    )
  end
end
