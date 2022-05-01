# frozen_string_literal: true

# include lib directory in LOAD_PATH
$LOAD_PATH.unshift File.expand_path("./lib", __dir__)
$LOAD_PATH.unshift File.expand_path("./app", __dir__)

require "sinatra/base"
require "controllers/status_controller"
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
