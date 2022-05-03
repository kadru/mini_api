# frozen_string_literal: true

require "test_helper"

class TransferTest < ApplicationTest
  def test_to_h
    transfer = Transfer.new from_id: "9f7484a2-c450-4928-bb6a-377245a1f99d",
                            to_id: "a881e9e4-4152-404e-a352-8b0687cbff62",
                            amount: 10,
                            created_at: Time.new(2022, 10, 10, 5)

    assert_equal({ "from" => "9f7484a2-c450-4928-bb6a-377245a1f99d",
                   "to" => "a881e9e4-4152-404e-a352-8b0687cbff62",
                   "id" => nil,
                   "amount" => 10,
                   "created_at" => "2022-10-10T05:00:00-05:00" },
                 transfer.to_h)
  end
end
