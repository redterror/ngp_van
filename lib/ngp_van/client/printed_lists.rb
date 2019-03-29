# frozen_string_literal: true

module NgpVan
  class Client
    module PrintedLists
      def printed_lists(params: {})
        get(path: 'printedLists', params: params)
      end

      def printed_list(id:, params: {})
        verify_id(id)
        get(path: "printedLists/#{id}", params: params)
      end
    end
  end
end
