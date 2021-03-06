# frozen_string_literal: true

ENV["APP_ENV"] ||= "test"
ENV["DATABASE_URL"] ||= "postgres:///mini_api_test"

require "minitest/autorun"
require "minitest/reporters"
require "minitest/hooks/test"
require "minitest/focus"
require "rack/test"
require "debug"
require "timecop"
require "./mini_api"
require "support/application_test"
require "support/request_test"
require "support/around_transaction"

Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(color: true)]
