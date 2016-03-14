# frozen_string_literal: true

require 'spec_helper'

module NgpVan
  class Client
    RSpec.describe MinivanExports do
      let(:client) { NgpVan::Client.new }

      describe '#minivan_exports' do
        let(:params) do
          {
            generatedAfter: '2012-10-01',
            generatedBefore: '2012-11-01',
            createdBy: '123',
            name: 'GOTV',
            hasSignup: true,
            '$expand' => 'eventSignups,canvassers'
          }
        end

        let(:response) { fixture('minivan_exports.json') }
        let(:url) { build_url(client: client, path: 'minivanExports') }

        before do
          stub_request(:get, url)
            .with(query: params)
            .to_return(
              body: response
            )
        end

        it 'requests the correct resource' do
          client.minivan_exports(params: params)
          expect(
            a_request(:get, url)
              .with(query: params)
          ).to have_been_made
        end

        it 'returns an array of districts' do
          minivan_exports = client.minivan_exports(params: params)
          expect(minivan_exports['items']).to be_a(Array)
        end

        it 'returns the requested district fields' do
          minivan_exports = client.minivan_exports(params: params)
          expect(minivan_exports['items'].first['minivanExportId']).to eq(2133)
        end
      end

      describe '#minivan_export' do
        let(:response) { fixture('minivan_export.json') }
        let(:url) { build_url(client: client, path: 'minivanExports/2133') }

        before do
          stub_request(:get, url)
            .to_return(
              body: response
            )
        end

        it 'requests the correct resource' do
          client.minivan_export(id: 2133)
          expect(
            a_request(:get, url)
          ).to have_been_made
        end

        it 'returns a minivan_export object' do
          minivan_export = client.minivan_export(id: 2133)
          expect(minivan_export).to be_a(Hash)
        end

        it 'returns the requested minivan_export' do
          minivan_export = client.minivan_export(id: 2133)
          expect(minivan_export['minivanExportId']).to eq(2133)
        end
      end
    end
  end
end
