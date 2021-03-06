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
    assert_equal %w[id balance], json_response.keys
  end

  def test_show_not_found
    get "/accounts/non-id"

    assert_equal 404, last_response.status
  end

  def test_deposit
    account = Account.create
    Timecop.freeze(Time.new(2022, 10, 10, 1)) do
      post_json "/accounts/#{account.id}/deposit",
                params: {
                  amount: 1000
                }

      assert_equal 201, last_response.status
      assert_match UUID_REGEXP, json_response["id"]
      assert_equal "2022-10-10T01:00:00-05:00", json_response["created_at"]
      assert_equal 1000, json_response["amount"]
    end

    get "/accounts/#{account.id}"

    assert_equal 200, last_response.status
    assert_equal 1000, json_response["balance"]
  end

  def test_deposit_when_is_not_found
    post_json "/accounts/random-uuid/deposit",
              params: {
                amount: 1000
              }

    assert_equal 404, last_response.status
  end
end
