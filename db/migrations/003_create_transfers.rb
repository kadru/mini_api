# frozen_string_literal: true

Sequel.migration do
  change do
    create_table(:transfers) do
      column :id, :uuid, primary_key: true, default: Sequel.function(:uuid_generate_v4)
      Bignum :amount, null: false
      DateTime :created_at, null: false
      foreign_key :from_id, :accounts, type: :uuid, null: false
      foreign_key :to_id, :accounts, type: :uuid, null: false
    end
  end
end
