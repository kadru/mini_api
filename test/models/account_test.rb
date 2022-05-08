# frozen_string_literal: true

require "test_helper"

class AccountTest < ApplicationTest
  include AroundTranscation

  # class methods

  def test_find_by_uuid
    account = Account.create
    found_account = Account.find_by_uuid(account.id)

    assert_equal account, found_account
  end

  def test_find_by_uuid_when_is_not_found
    found_account = Account.find_by_uuid(SecureRandom.uuid)

    assert_nil found_account
  end

  def test_find_by_uuid_when_is_not_valid_uuid
    found_account = Account.find_by_uuid("not-uuid")

    assert_nil found_account
  end

  def test_find_by_uuid_when_value_is_nil
    assert_nil Account.find_by_uuid(nil)
  end

  # instance methods

  def test_create
    account = Account.create
    assert_in_delta 0.0, account.balance
    assert_match(UUID_REGEXP, account.id)
  end

  def test_withdraw!
    account = Account.create balance: 200

    account.withdraw! 100
    assert_equal 100, account.balance
  end

  def test_withdraw_when_balance_is_greater_than_balance
    account = Account.create balance: 200

    assert_raises(Account::InvalidAmountError, "cannot withdraw, amount is greater than balance") do
      account.withdraw! 201
    end
  end

  def test_deposit
    account = Account.create balance: 100

    account.deposit 200

    assert_equal 300, account.balance
  end
end
