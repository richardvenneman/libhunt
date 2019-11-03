require 'sinatra'
require 'sinatra/json'
require 'sinatra/reloader' if development?

require_relative 'github'

get '/libraries/' do
  language = params[:language] || 'Ruby'
  response = Github::Api::Client.query(
    Github::Query,
    variables: {
      query: "language:#{language} sort:updated-desc",
      limit: Github::QUERY_LIMIT
    }
  )

  json Github.normalize_response(response.to_h)
end
