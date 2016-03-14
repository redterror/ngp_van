# frozen_string_literal: true

module NgpVan
  class Client
    module ActivistCodes
      def activist_codes(params: {})
        get(path: 'activistCodes', params: params)
      end

      def activist_code(id:, params: {})
        get(path: "activistCodes/#{id}", params: params)
      end
    end
  end
end
