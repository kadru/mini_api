# frozen_string_literal: true

# include lib and app directory in LOAD_PATH
$LOAD_PATH.unshift File.expand_path("./lib", __dir__)
$LOAD_PATH.unshift File.expand_path("./app", __dir__)

require "sinatra/base"
require "constants"
require "db"
require "controllers/status_controller"
require "controllers/accounts_controller"

# Mini Api entry point
class MiniApi < Sinatra::Base
  set :default_content_type, :json

  use StatusController
  use AccountsController
end
