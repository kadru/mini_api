# frozen_string_literal: true

require "test_helper"

class TransfersTest < RequestTest
  def test_post_transfer
    from_account = Account.create(balance: 100)
    to_account = Account.create(balance: 0)

    post "/transfers",
         {
           "from" => from_account.id,
           "to" => to_account.id,
           "amount" => 100
         }.to_json,
         { "CONTENT_TYPE" => "application/json" }

    assert_equal 201, last_response.status
    assert_match(UUID_REGEXP, json_response["id"])
    assert_equal(from_account.id, json_response["from"])
    assert_equal(to_account.id, json_response["to"])
    assert_equal 100, json_response["amount"]
    assert_equal(Time.new(2022, 10, 10, 1).iso8601, json_response["created_at"])
  end

  def around
    Timecop.freeze(Time.new(2022, 10, 10, 1)) do
      super
    end
  end
end
