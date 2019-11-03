require 'sinatra'
require 'sinatra/reloader' if development?

get '/repositories/' do
  'Hello, world'
end
