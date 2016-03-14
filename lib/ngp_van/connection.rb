# frozen_string_literal: true

require 'ngp_van/response/raise_error'
require 'faraday_middleware'

module NgpVan
  module Connection
    private

    # rubocop:disable Metrics/MethodLength
    def connection
      options = {
        url: NgpVan.configuration.api_endpoint,
        headers: {
          'Accept' => 'application/json; charset=utf-8',
          'User-Agent' => NgpVan.configuration.user_agent
        }
      }

      Faraday::Connection.new(options) do |connection|
        connection.basic_auth(
          NgpVan.configuration.application_name,
          NgpVan.configuration.api_key
        )

        connection.request(:json)
        connection.use NgpVan::Response::RaiseError
        connection.adapter(Faraday.default_adapter)
      end
    end
  end
end
