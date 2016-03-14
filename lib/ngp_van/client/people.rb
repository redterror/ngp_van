# frozen_string_literal: true

module NgpVan
  class Client
    module People
      def find_person(body: {})
        post(path: 'people/find', body: body)
      end

      def find_or_create_person(body: {})
        post(path: 'people/findOrCreate', body: body)
      end

      def person(id:, params: {})
        get(path: "people/#{id}", params: params)
      end

      def person_by_type(id:, type:, params: {})
        get(path: "people/#{type}:#{id}", params: params)
      end

      def create_canvass_responses_for_person(id:, body: {})
        post(path: "people/#{id}/canvassResponses", body: body)
      end

      def create_canvass_responses_for_person_by_type(id:, type:, body: {})
        post(path: "people/#{type}:#{id}/canvassResponses", body: body)
      end
    end
  end
end
