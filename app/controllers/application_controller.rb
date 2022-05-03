# frozen_string_literal: true

class ApplicationController < Sinatra::Base
  use Rack::JSONBodyParser
end
