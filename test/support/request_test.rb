# frozen_string_literal: true

class RequestTest < ApplicationTest
  include Rack::Test::Methods

  def app
    MiniApi
  end

  def json_response
    JSON.parse(last_response.body)
  end

  def post_json(path, params: nil, headers: {})
    post(path,
         params.nil? ? params : params.to_json,
         { "CONTENT_TYPE" => "application/json" }.merge(headers))
  end
end
