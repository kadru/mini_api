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
end
