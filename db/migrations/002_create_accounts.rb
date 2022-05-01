# frozen_string_literal: true

Sequel.migration do
  change do
    create_table(:accounts) do
      column :id, :uuid, primary_key: true, default: Sequel.function(:uuid_generate_v4)
      Bignum :balance, default: 0
    end
  end
end
