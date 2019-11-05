# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../server'

class ServerTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_it_returns_json
    get '/libraries/'
    assert last_response.ok?
    assert_equal 'application/json', last_response.headers['Content-Type']
  end

  def test_returns_normalized_json
    get '/libraries/'

    data = JSON.parse(last_response.body)
    assert_equal Array, data.class

    library = data.first
    assert_kind_of String, library['url']
    assert_kind_of String, library['name']
    assert_kind_of String, library['author']
    assert_kind_of String, library['source']
    assert library.has_key?('description')
  end
end
