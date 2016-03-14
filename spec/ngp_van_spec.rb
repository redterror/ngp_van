# frozen_string_literal: true

require 'spec_helper'

describe NgpVan do
  it 'has a version number' do
    expect(NgpVan::VERSION).to_not be nil
  end

  describe '.client' do
    it 'creates a new NgpVan::Client' do
      expect(NgpVan.client).to be_instance_of(NgpVan::Client)
    end

    context 'when @client has been previously assigned' do
      it 'returns the @client' do
        client = NgpVan.client
        expect(NgpVan.client).to eq(client)
      end
    end
  end

  it 'delegates methods to the client' do
    client = double(people: true)
    allow(NgpVan).to receive(:client).and_return(client)
    expect(client).to receive(:people)
    NgpVan.people
  end
end
