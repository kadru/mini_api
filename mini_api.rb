# frozen_string_literal: true

require "sinatra/base"

# Mini Api entry point
class MiniApi < Sinatra::Base
  set :default_content_type, :json

  get "/status" do
    {
      enviroment: ENV["RACK_ENV"]
    }.to_json
  end
end
