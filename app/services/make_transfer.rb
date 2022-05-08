# frozen_string_literal: true

# Make transfer from an account to another with the given balance
class MakeTransfer
  def self.call(from:, from_id:, to:, to_id:, amount:)
    new(from:, from_id:, to:, to_id:, amount:).call
  end

  def initialize(from:, from_id:, to:, to_id:, amount:)
    @from_id = from_id
    @from = from
    @to = to
    @to_id = to_id
    @amount = amount
  end

  def call
    validate || transfer
  end

  private

  attr_reader :from, :from_id, :to, :to_id, :amount

  def validate
    return missing_from_id_result if from.nil?

    return missing_to_id_result if to.nil?

    return not_sufficient_funds_result if amount > from.balance
  end

  def transfer
    from.withdraw! amount
    to.deposit amount

    {
      status: "success",
      result: Transfer.create(from_id: from.id, to_id: to.id, amount:).to_h
    }
  end

  def missing_from_id_result
    {
      status: "failure",
      errors: [
        {
          "title" => "transferring account not found",
          "detail" => "the account with the given id #{from_id} doesn't exists"
        }
      ]
    }
  end

  def missing_to_id_result
    {
      status: "failure",
      errors: [
        {
          "title" => "recipient account not found",
          "detail" => "the account with the given id #{to_id} doesn't exists"
        }
      ]
    }
  end

  def not_sufficient_funds_result
    {
      status: "failure",
      errors: [
        {
          "title" => "unsufficient funds",
          "detail" => "the transferring account have insufficient funds"
        }
      ]
    }
  end
end
