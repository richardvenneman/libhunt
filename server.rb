require 'sinatra'
require 'sinatra/reloader' if development?

get '/libraries/' do
  'Hello, world'
end
