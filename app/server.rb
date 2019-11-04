# frozen_string_literal: true

require 'sinatra'
require 'sinatra/json'
require 'sinatra/reloader' if development?

require_relative 'lib/apis/github_api'
require_relative 'lib/apis/gitlab_api'
require_relative 'lib/apis/timeout_error'
require_relative 'lib/models/repository_collection'

set :show_exceptions, :after_handler

error ApiTimeoutError do
  json(message: 'There was a problem fetching data from external sources.')
end

get '/libraries/' do
  language = params[:language] || 'Ruby'
  github_repositories = GithubApi.get_repositories(language)
  gitlab_repositories = GitlabApi.get_repositories(language)

  json RepositoryCollection.new(github_repositories, gitlab_repositories).sorted
end
