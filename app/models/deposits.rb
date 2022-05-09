# frozen_string_literal: true

# Store deposits from an account
class Deposit < Sequel::Model
  def to_h
    {
      "id" => id,
      "created_at" => created_at.iso8601,
      "amount" => amount
    }
  end
end
