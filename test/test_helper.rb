# frozen_string_literal: true

ENV["RACK_ENV"] ||= "test"
ENV["DATABASE_URL"] = "postgres:///mini_api_test"

require "minitest/autorun"
require "minitest/reporters"
require 'rack/test'
require "debug"
require "support/request_test"
require "./mini_api"

Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(color: true)]
