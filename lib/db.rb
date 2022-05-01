# frozen_string_literal: true

require "sequel"

Sequel.extension :fiber_concurrency
DB = Sequel.connect(ENV.fetch("DATABASE_URL"))
DB.freeze
