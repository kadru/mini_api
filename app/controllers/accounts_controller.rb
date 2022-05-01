# frozen_string_literal: true

# Manage accounts
class AccountsController < Sinatra::Base
  post "/accounts" do
    account = Account.create
    status 201
    {
      "id" => account.id,
      "balance" => account.balance
    }.to_json
  end
end
