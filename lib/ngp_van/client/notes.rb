# frozen_string_literal: true

module NgpVan
  class Client
    module Notes
      def note_category_types(params: {})
        get(path: 'notes/categoryTypes', params: params)
      end

      def note_categories(params: {})
        get(path: 'notes/categories', params: params)
      end

      def note_category(id:, params: {})
        get(path: "notes/categories/#{id}", params: params)
      end
    end
  end
end
