# frozen_string_literal: true

# Represents transfer between accounts
class Transfer < Sequel::Model
  def to_h
    {
      "id" => id,
      "from" => from_id,
      "to" => to_id,
      "amount" => amount,
      "created_at" => created_at.iso8601
    }
  end
end
