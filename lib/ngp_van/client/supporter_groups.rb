# frozen_string_literal: true

module NgpVan
  class Client
    module SupporterGroups
      def create_supporter_group(body: {})
        post(path: 'supporterGroups', body: body)
      end

      def supporter_group(id:, params: {})
        verify_id(id)
        get(path: "supporterGroups/#{id}", params: params)
      end

      def supporter_groups(params: {})
        get(path: 'supporterGroups', params: params)
      end

      def delete_supporter_group(id:, params: {})
        verify_id(id)
        delete(path: "supporterGroups/#{id}", params: params)
      end

      def add_person_to_supporter_group(supporter_group_id:, id:)
        verify_ids(id, supporter_group_id)
        put(path: "supporterGroups/#{supporter_group_id}/people/#{id}")
      end

      def remove_person_from_supporter_group(supporter_group_id:, id:)
        verify_ids(id, supporter_group_id)
        delete(path: "supporterGroups/#{supporter_group_id}/people/#{id}")
      end
    end
  end
end
