require 'sinatra'
require 'sinatra/json'
require 'sinatra/reloader' if development?

require_relative 'lib/github'
require_relative 'lib/gitlab'
require_relative 'lib/repository_collection'
require_relative 'lib/api_timeout_error'

set :show_exceptions, :after_handler

error ApiTimeoutError do
  json({ message: "There was a problem fetching data from external sources." })
end

get '/libraries/' do
  language = params[:language] || 'Ruby'
  github_repositories = GithubApi.get_repositories(language)
  gitlab_repositories = GitlabApi.get_repositories(language)

  json RepositoryCollection.new(github_repositories + gitlab_repositories).sorted
end
