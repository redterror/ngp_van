# frozen_string_literal: true

module NgpVan
  class Client
    module CanvassResponses
      def canvass_responses_contact_types(params: {})
        get(path: 'canvassResponses/contactTypes', params: params)
      end

      def canvass_responses_input_types(params: {})
        get(path: 'canvassResponses/inputTypes', params: params)
      end

      def canvass_responses_result_codes(params: {})
        get(path: 'canvassResponses/resultCodes', params: params)
      end
    end
  end
end
