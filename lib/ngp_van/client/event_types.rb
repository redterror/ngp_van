# frozen_string_literal: true

module NgpVan
  class Client
    module EventTypes
      def event_types(params: {})
        get(path: 'events/types', params: params)
      end

      def event_type(id:, params: {})
        verify_id(id)
        get(path: "events/types/#{id}", params: params)
      end
    end
  end
end
