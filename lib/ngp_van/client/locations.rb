# frozen_string_literal: true

module NgpVan
  class Client
    module Locations
      def locations(params: {})
        get(path: 'locations', params: params)
      end

      def location(id:, params: {})
        get(path: "locations/#{id}", params: params)
      end

      def find_or_create_location(body: {})
        post(path: 'locations/findOrCreate', body: body)
      end

      def create_location(body: {})
        post(path: 'locations', body: body)
      end

      def delete_location(id:)
        delete(path: "locations/#{id}")
      end
    end
  end
end
