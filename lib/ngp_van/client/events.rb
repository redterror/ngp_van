# frozen_string_literal: true

module NgpVan
  class Client
    module Events
      def create_event(body: {})
        post(path: 'events', body: body)
      end

      def create_event_shift(id:, body: {})
        post(path: "events/#{id}/shifts", body: body)
      end

      def event(id:, params: {})
        get(path: "events/#{id}", params: params)
      end

      def events(params: {})
        get(path: 'events', params: params)
      end

      def update_event(id:, body: {})
        put(path: "events/#{id}", body: body)
      end

      def delete_event(id:)
        delete(path: "events/#{id}")
      end
    end
  end
end
