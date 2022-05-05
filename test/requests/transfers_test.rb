# frozen_string_literal: true

require "test_helper"

class TransfersTest < RequestTest
  def test_post_transfer
    from_account = Account.create(balance: 100)
    to_account = Account.create(balance: 0)

    post_json "/transfers",
              params: {
                "from" => from_account.id,
                "to" => to_account.id,
                "amount" => 100
              }

    assert_equal 201, last_response.status
    assert_match(UUID_REGEXP, json_response["id"])
    assert_equal(from_account.id, json_response["from"])
    assert_equal(to_account.id, json_response["to"])
    assert_equal 100, json_response["amount"]
    assert_equal(Time.new(2022, 10, 10, 1).iso8601, json_response["created_at"])
  end

  def test_post_transfer_when_from_account_has_smaller_balance_than_transfer_amount
    from_account = Account.create(balance: 100)
    to_account = Account.create(balance: 0)

    post_json "/transfers",
              params: {
                "from" => from_account.id,
                "to" => to_account.id,
                "amount" => 101
              }

    assert_equal 422, last_response.status
    assert_equal(
      {
        "errors" => [
          {
            "title" => "unsufficient funds",
            "detail" => "the transferring account have insufficient funds"
          }
        ]
      },
      json_response
    )
  end

  def test_post_transfer_when_from_account_is_not_found
    to_account = Account.create(balance: 0)

    post_json "/transfers",
              params: {
                "from" => "2f197419-7538-4d76-93c2-60edc2d865b5",
                "to" => to_account.id,
                "amount" => 101
              }

    assert_equal 422, last_response.status
    assert_equal(
      {
        "errors" => [
          {
            "title" => "transeferring account not found",
            "detail" => "the account with the given id 2f197419-7538-4d76-93c2-60edc2d865b5 doesn't exists"
          }
        ]
      },
      json_response
    )
  end

  def test_post_transfer_when_to_account_is_not_found
    from_account = Account.create(balance: 0)

    post_json "/transfers",
              params: {
                "from" => from_account.id,
                "to" => "286eff0d-62f9-4376-9ba5-42ca533e485d",
                "amount" => 101
              }

    assert_equal 422, last_response.status
    assert_equal(
      {
        "errors" => [
          {
            "title" => "recipient account not found",
            "detail" => "the account with the given id 286eff0d-62f9-4376-9ba5-42ca533e485d doesn't exists"
          }
        ]
      },
      json_response
    )
  end

  def around
    Timecop.freeze(Time.new(2022, 10, 10, 1)) do
      super
    end
  end
end
