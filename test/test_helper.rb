# frozen_string_literal: true

ENV["RACK_ENV"] ||= "test"
ENV["DATABASE_URL"] = "postgres:///mini_api_test"

require "minitest/autorun"
require "minitest/reporters"
require "minitest/hooks/test"
require 'rack/test'
require "debug"
require "./mini_api"
require "support/application_test"
require "support/request_test"
require "support/around_transaction"

Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(color: true)]
