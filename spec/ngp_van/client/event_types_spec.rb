# frozen_string_literal: true

require 'spec_helper'

module NgpVan
  class Client
    RSpec.describe EventTypes do
      let(:client) { NgpVan::Client.new }

      describe '#event_types' do
        let(:response) { fixture('event_types.json') }
        let(:url) { build_url(client: client, path: 'events/types') }

        before do
          stub_request(:get, url)
            .to_return(
              body: response
            )
        end

        it 'requests the correct resource' do
          client.event_types
          expect(
            a_request(:get, url)
          ).to have_been_made
        end

        it 'returns an array of event types' do
          event_types = client.event_types
          expect(event_types).to be_a(Array)
        end

        it 'returns the requested event types' do
          event_types = client.event_types
          expect(event_types.first['name']).to eq('Phone Bank')
        end
      end

      describe '#event_type' do
        let(:response) { fixture('event_type.json') }
        let(:url) { build_url(client: client, path: 'events/types/143856') }

        before do
          stub_request(:get, url)
            .to_return(
              body: response
            )
        end

        it 'requests the correct resource' do
          client.event_type(id: 143_856)
          expect(
            a_request(:get, url)
          ).to have_been_made
        end

        it 'returns a event_type object' do
          event_type = client.event_type(id: 143_856)
          expect(event_type).to be_a(Hash)
        end

        it 'returns the requested event_type' do
          event_type = client.event_type(id: 143_856)
          expect(event_type['eventTypeId']).to eq(143_856)
        end
      end
    end
  end
end
