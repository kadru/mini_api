# frozen_string_literal: true

# Represent bank accounts
class Account < Sequel::Model
  dataset_module do
    def uuid?(string)
      string.size == 36 && string.match(UUID_REGEXP)
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
end
