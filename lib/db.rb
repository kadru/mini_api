# frozen_string_literal: true

require "sequel"

Sequel.extension :fiber_concurrency
DB = Sequel.connect(ENV.fetch("DATABASE_URL"))

Sequel::Model.plugin :subclasses
Dir["./app/models/*.rb"].each { |f| require f }

Sequel::Model.freeze_descendents

DB.freeze
