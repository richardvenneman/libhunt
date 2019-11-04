require 'sinatra'
require 'sinatra/json'
require 'sinatra/reloader' if development?

require_relative 'lib/github'
require_relative 'lib/gitlab'
require_relative 'lib/repository_collection'

get '/libraries/' do
  language = params[:language] || 'Ruby'
  github_repositories = GithubApi.get_repositories(language)
  gitlab_repositories = GitlabApi.get_repositories(language)

  json RepositoryCollection.new(github_repositories + gitlab_repositories).sorted
end
