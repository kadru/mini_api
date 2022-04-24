# frozen_string_literal: true

require "test_helper"

class Request < Minitest::Test
  include Rack::Test::Methods

  def json_response
    JSON.parse(last_response.body)
  end

  def app
    MiniApi
  end

  def test_get_status
    get "/status"

    expected_body = {
      "enviroment" => "test",
      "db_connection" => "ok"
    }

    assert last_response.ok?
    assert_equal expected_body, json_response
  end
end
