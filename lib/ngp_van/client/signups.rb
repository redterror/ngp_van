# frozen_string_literal: true

module NgpVan
  class Client
    module Signups
      def signup_statuses(params: {})
        get(path: 'signups/statuses', params: params)
      end

      def signup(id:, params: {})
        verify_id(id)
        get(path: "signups/#{id}", params: params)
      end

      def signups(params: {})
        get(path: 'signups', params: params)
      end

      def create_signup(body: {})
        post(path: 'signups', body: body)
      end

      def update_signup(id:, body: {})
        verify_id(id)
        put(path: "signups/#{id}", body: body)
      end

      def delete_signup(id:)
        verify_id(id)
        delete(path: "signups/#{id}")
      end
    end
  end
end
