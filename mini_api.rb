# frozen_string_literal: true

# include lib and app directory in LOAD_PATH
$LOAD_PATH.unshift File.expand_path("./lib", __dir__)
$LOAD_PATH.unshift File.expand_path("./app", __dir__)

require "sinatra/base"
require "sinatra/json"
require "rack/contrib"
require "constants"
require "db"
require "controllers/application_controller"
require "controllers/status_controller"
require "controllers/accounts_controller"
require "controllers/transfers_controller"

# Mini Api entry point
class MiniApi < Sinatra::Base
  use StatusController
  use AccountsController
  use TransfersController
end
