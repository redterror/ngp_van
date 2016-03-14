# frozen_string_literal: true

module NgpVan
  module Response
    def self.create(body)
      JSON.parse(body)
    # The VAN API does not always return JSON. For example, when creating a new
    # code, you post to /codes. The return is the integer ID of the newly
    # created code, not a json representation of it. For cases like this, we
    # will just return the body un-parsed.
    rescue JSON::ParserError
      body
    end
  end
end
