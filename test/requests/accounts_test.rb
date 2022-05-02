# frozen_string_literal: true

require "test_helper"

class AccountsTest < RequestTest
  include AroundTranscation

  def test_create_account
    post "/accounts"

    assert_equal(201, last_response.status)
    assert_match(/[a-z\d]{8}-[a-z\d]{4}-[a-z\d]{4}-[a-z\d]{4}-[a-z\d]{12}/, json_response["id"])
    assert_equal(0, json_response["balance"])
  end
end
