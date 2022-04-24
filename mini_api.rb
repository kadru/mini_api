# frozen_string_literal: true

require "sinatra/base"
require "db"

# Mini Api entry point
class MiniApi < Sinatra::Base
  set :default_content_type, :json

  get "/status" do
    {
      enviroment: ENV["RACK_ENV"],
      db_connection: DB.run("select 1 + 1").nil? && :ok
    }.to_json
  end
end
