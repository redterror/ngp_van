# frozen_string_literal: true

require 'spec_helper'

module NgpVan
  class Client
    RSpec.describe ActivistCodes do
      let(:client) { NgpVan::Client.new }

      describe '#activist_codes' do
        let(:params) do
          {
            statuses: 'Active,Archived',
            type: 'Volunteer'
          }
        end

        let(:response) { fixture('activist_codes.json') }

        let(:url) { build_url(client: client, path: 'activistCodes') }

        before do
          stub_request(:get, url)
            .with(query: params)
            .to_return(
              body: response
            )
        end

        it 'requests the correct resource' do
          client.activist_codes(params: params)
          expect(
            a_request(:get, url)
              .with(query: params)
          ).to have_been_made
        end

        it 'returns an array of items' do
          activist_codes = client.activist_codes(params: params)
          expect(activist_codes['items']).to be_a(Array)
        end

        it 'returns the requested activist codes' do
          activist_codes = client.activist_codes(params: params)
          expect(activist_codes['items'].first['activistCodeId']).to eq(3214)
        end
      end

      describe '#activist_code' do
        let(:params) do
          {
            activistCodeId: 'EID28CG'
          }
        end

        let(:response) { fixture('activist_code.json') }

        before do
          stub_request(:get, build_url(client: client,
                                       path: 'activistCodes/3202'))
            .with(query: params)
            .to_return(
              body: response
            )
        end

        it 'requests the correct resource' do
          client.activist_code(id: 3202, params: params)
          expect(
            a_request(:get, build_url(client: client,
                                      path: 'activistCodes/3202'))
              .with(query: params)
          ).to have_been_made
        end

        it 'returns an activist code object' do
          activist_code = client.activist_code(id: 3202, params: params)
          expect(activist_code).to be_a Hash
        end

        it 'returns the requested activist code properties' do
          activist_code = client.activist_code(id: 3202, params: params)
          expect(activist_code['activistCodeId']).to eq(3202)
        end
      end
    end
  end
end
