# frozen_string_literal: true

# Represent bank accounts
class Account < Sequel::Model
  class InvalidAmountError < StandardError; end
  one_to_many :deposits

  dataset_module do
    def uuid?(string)
      string && string.size == 36 && string.match(UUID_REGEXP)
    end

    def find_by_uuid(id)
      return unless uuid?(id)

      self.[](id:)
    end
  end

  def to_h
    {
      "id" => id,
      "balance" => balance
    }
  end

  def withdraw!(amount)
    raise InvalidAmountError, "cannot withdraw, amount is greater than balance" if amount > balance

    update balance: balance - amount
  end

  def deposit(amount) = update balance: balance + amount
end
