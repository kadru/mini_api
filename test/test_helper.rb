# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)

ENV["RACK_ENV"] ||= "test"
ENV["DATABASE_URL"] = "postgres:///mini_api_test"

require "minitest/autorun"
require "minitest/reporters"
require 'rack/test'
require "debug"
require "./mini_api"

Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(color: true)]
