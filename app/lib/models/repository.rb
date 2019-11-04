# frozen_string_literal: true

class Repository
  attr_accessor :url, :name, :description, :author, :updated_at, :source

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
