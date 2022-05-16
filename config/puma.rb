# frozen_string_literal: true

require "sequel"

before_fork do
  Sequel::DATABASES.each(&:disconnect)
end
