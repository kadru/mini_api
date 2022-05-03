# frozen_string_literal: true

# Make transfers from account to another
class TransfersController < Sinatra::Base
  use Rack::JSONBodyParser

  post "/transfers" do
    from = Account.find_by_uuid params[:from]
    to = Account.find_by_uuid params[:to]
    amount = params[:amount]
    from.update balance: from.balance - amount
    to.update balance: to.balance + amount

    transfer = Transfer.create(from_id: from.id, to_id: to.id, amount: params[:amount])

    status 201
    json transfer.to_h
  end
end
