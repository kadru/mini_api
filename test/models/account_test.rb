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
end
