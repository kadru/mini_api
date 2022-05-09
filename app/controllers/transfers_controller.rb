# frozen_string_literal: true

# Make transfers from account to another
class TransfersController < ApplicationController
  post "/transfers" do
    from = Account.for_update.find_by_uuid params[:from]
    to = Account.for_update.find_by_uuid params[:to]

    case MakeTransfer.call(from:,
                           from_id: params[:from],
                           to:,
                           to_id: params[:to],
                           amount: params[:amount])
    in { status: "success", result: result }
      status 201
      json result
    in { status: "failure", errors: errors }
      status 422
      json({ errors: })
    end
  end
end
