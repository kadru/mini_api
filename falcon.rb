#!/usr/bin/env -S falcon host
# frozen_string_literal: true

load :rack, :supervisor

hostname = File.basename(__dir__)
rack hostname do
  # TODO: Update proctocol to use HTTP/2
  protocol { Async::HTTP::Protocol::HTTP11 }
  endpoint do
    Async::HTTP::Endpoint.parse("http://#{ENV.fetch('BINDING')}").with(protocol:)
  end
end

supervisor
