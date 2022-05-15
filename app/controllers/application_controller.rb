# frozen_string_literal: true

class ApplicationController < Sinatra::Base
  configure :development, :production do
    use Rack::CommonLogger, Logger.new($stdout)
    enable :logging
  end

  use Rack::JSONBodyParser
end
