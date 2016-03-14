# frozen_string_literal: true

module NgpVan
  class Client
    module Codes
      def code_supported_entities(params: {})
        get(path: 'codes/supportedEntities', params: params)
      end

      def codes(params: {})
        get(path: 'codes', params: params)
      end

      def code(id:, params: {})
        get(path: "codes/#{id}", params: params)
      end

      def create_code(body: {})
        post(path: 'codes', body: body)
      end

      def update_code(id:, body: {})
        put(path: "codes/#{id}", body: body)
      end

      def delete_code(id:)
        delete(path: "codes/#{id}")
      end
    end
  end
end
