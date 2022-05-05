# frozen_string_literal: true

# Make transfers from account to another
class TransfersController < ApplicationController
  post "/transfers" do
    from = Account.find_by_uuid params[:from]
    to = Account.find_by_uuid params[:to]
    amount = params[:amount]

    if from.nil?
      status 422
      json({ "errors" => [
             {
               "title" => "transeferring account not found",
               "detail" => "the account with the given id #{params[:from]} doesn't exists"
             }
           ] })
    elsif to.nil?
      status 422
      json({ "errors" => [
             {
               "title" => "recipient account not found",
               "detail" => "the account with the given id #{params[:to]} doesn't exists"
             }
           ] })
    elsif amount > from.balance
      status 422
      json({ "errors" => [
             {
               "title" => "unsufficient funds",
               "detail" => "the transferring account have insufficient funds"
             }
           ] })
    else
      from.update balance: from.balance - amount
      to.update balance: to.balance + amount

      transfer = Transfer.create(from_id: from.id, to_id: to.id, amount: params[:amount])

      status 201
      json transfer.to_h
    end
  end
end
