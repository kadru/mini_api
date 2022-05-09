# frozen_string_literal: true

# Manage accounts
class AccountsController < ApplicationController
  use Rack::JSONBodyParser

  post "/accounts" do
    account = Account.create
    status 201
    json account.to_h
  end

  get "/accounts/:id" do
    account = Account.find_by_uuid(params[:id])
    if account
      json account.to_h
    else
      status 404
    end
  end

  post "/accounts/:id/deposit" do
    DB.transaction do
      account = Account.for_update.find_by_uuid(params[:id])
      amount = params[:amount]
      if account
        account.deposit amount
        deposit = account.add_deposit amount: amount
        status 201
        json deposit.to_h
      else
        status 404
      end
    end
  end
end
