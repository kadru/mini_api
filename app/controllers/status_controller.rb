# frozen_string_literal: true

# Get current application status
class StatusController < Sinatra::Base
  get "/status" do
    {
      enviroment: ENV.fetch("APP_ENV"),
      db_connection: DB.run("select 1 + 1").nil? && :ok
    }.to_json
  end
end
