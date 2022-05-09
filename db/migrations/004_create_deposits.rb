# frozen_string_literal: true

Sequel.migration do
  change do
    create_table(:deposits) do
      column :id, :uuid, primary_key: true, default: Sequel.function(:uuid_generate_v4)
      foreign_key :account_id, :accounts, type: :uuid, null: false
      Bignum :amount, null: false
      DateTime :created_at, null: false
    end
  end
end
