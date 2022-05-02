# frozen_string_literal: true

require "test_helper"

class AccountsTest < RequestTest
  include AroundTranscation

  def test_create_account
    post "/accounts"

    assert_equal(201, last_response.status)
    assert_match(UUID_REGEXP, json_response["id"])
    assert_equal(0, json_response["balance"])
  end

  def test_show_account
    account = Account.create
    get "/accounts/#{account.id}"

    assert_equal 200, last_response.status
    assert_equal json_response.keys, %w[id balance]
  end

  def test_show_not_found
    get "/accounts/non-id"

    assert_equal 404, last_response.status
  end
end
