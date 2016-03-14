# frozen_string_literal: true

require 'spec_helper'

module NgpVan
  class Client
    RSpec.describe DistrictFields do
      let(:client) { NgpVan::Client.new }

      describe '#district_fields' do
        let(:params) do
          {
            custom: false,
            organizeAt: false
          }
        end

        let(:response) { fixture('district_fields.json') }
        let(:url) { build_url(client: client, path: 'districtFields') }

        before do
          stub_request(:get, url)
            .with(query: params)
            .to_return(
              body: response
            )
        end

        it 'requests the correct resource' do
          client.district_fields(params: params)
          expect(
            a_request(:get, url)
              .with(query: params)
          ).to have_been_made
        end

        it 'returns an array of districts' do
          district_fields = client.district_fields(params: params)
          expect(district_fields['districts']).to be_a(Array)
        end

        it 'returns the requested district fields' do
          district_fields = client.district_fields(params: params)
          expect(district_fields['districts'].first['name'])
            .to eq('State Senate')
        end
      end

      describe '#district_field' do
        let(:response) { fixture('district_field.json') }
        let(:url) { build_url(client: client, path: 'districtFields/999') }

        before do
          stub_request(:get, url)
            .to_return(
              body: response
            )
        end

        it 'requests the correct resource' do
          client.district_field(id: 999)
          expect(
            a_request(:get, url)
          ).to have_been_made
        end

        it 'returns a district_field object' do
          district_field = client.district_field(id: 999)
          expect(district_field).to be_a(Hash)
        end

        it 'returns the requested district_field' do
          district_field = client.district_field(id: 999)
          expect(district_field['districtFieldId']).to eq(999)
        end
      end
    end
  end
end
