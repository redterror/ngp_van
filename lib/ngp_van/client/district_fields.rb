# frozen_string_literal: true

module NgpVan
  class Client
    module DistrictFields
      def district_fields(params: {})
        get(path: 'districtFields', params: params)
      end

      def district_field(id:)
        get(path: "districtFields/#{id}")
      end
    end
  end
end
