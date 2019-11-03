require_relative 'test_helper'
require_relative '../server'

class ServerTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_it_says_hello_world
    get '/repositories/'
    assert last_response.ok?
    assert_equal 'Hello, world', last_response.body
  end
end
