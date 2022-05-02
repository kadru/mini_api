# frozen_string_literal: true

# Manage accounts
class AccountsController < Sinatra::Base
  post "/accounts" do
    account = Account.create
    status 201
    account.to_json
  end

  get "/accounts/:id" do
    account = Account.find_by_uuid(params[:id])
    if account
      account.to_json
    else
      status 404
    end
  end
end
