# frozen_string_literal: true

# include lib directory in LOAD_PATH
$LOAD_PATH.unshift File.expand_path("./lib", __dir__)

require "./mini_api"

run MiniApi
