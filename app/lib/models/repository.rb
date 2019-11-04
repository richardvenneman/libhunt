# frozen_string_literal: true

class Repository
  attr_accessor :url, :name, :description, :author, :updated_at, :source

  def initialize(url, name, description, author, updated_at, source)
    @url = url
    @name = name
    @description = description
    @author = author
    @updated_at = DateTime.parse(updated_at)
    @source = source
  end

  def self.from_github(data)
    new(
      data['url'],
      data['name'],
      data['description'],
      data['owner']['login'],
      data['updatedAt'],
      'GitHub'
    )
  end

  def self.from_gitlab(data)
    new(
      data['web_url'],
      data['name'],
      data['description'],
      data['namespace']['path'],
      data['last_activity_at'],
      'GitLab'
    )
  end

  def to_h
    {
      url: @url,
      name: @name,
      description: @description,
      author: @author,
      updated_at: @updated_at.iso8601(3),
      source: @source
    }
  end
end
