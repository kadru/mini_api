# frozen_string_literal: true

require "test_helper"

class AccountTest < ApplicationTest
  include AroundTranscation

  def test_create
    account = Account.create
    assert_equal 0.0, account.balance
    assert_match(/[a-z\d]{8}-[a-z\d]{4}-[a-z\d]{4}-[a-z\d]{4}-[a-z\d]{12}/, account.id)
  end
end
