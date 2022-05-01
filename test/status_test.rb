# frozen_string_literal: true

require "test_helper"

class RequestStatus < RequestTest
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
