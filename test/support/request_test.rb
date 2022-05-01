# frozen_string_literal: true

class RequestTest < Minitest::Test
  include Rack::Test::Methods

  def app
    MiniApi
  end

  def json_response
    JSON.parse(last_response.body)
  end
end
