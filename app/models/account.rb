# frozen_string_literal: true

# Represent bank accounts
class Account < Sequel::Model
  UUID_REGEXP = /[a-z\d]{8}-[a-z\d]{4}-[a-z\d]{4}-[a-z\d]{4}-[a-z\d]{12}/

  dataset_module do
    def uuid?(string)
      string.size == 36 && string.match(UUID_REGEXP)
    end

    def find_by_uuid(id)
      return unless uuid?(id)

      self.[](id:)
    end
  end
end
