# frozen_string_literal: true

require 'spec_helper'

module NgpVan
  RSpec.describe Client do
    describe 'initialization' do
      describe 'with a specified configuration' do
        let(:config) { NgpVan::Configuration.new }

        subject { NgpVan::Client.new(config) }

        it 'should accept and store as config' do
          expect(subject.config).to eq(config)
        end
      end

      describe 'without a specified config' do
        it 'should get the default' do
          expect(subject.config).to eq(NgpVan.configuration)
        end
      end
    end

    describe 'usage' do
      it 'should be possible to build a config and use it per client' do
        configuration = NgpVan::Configuration.new
        configuration.user_agent = 'test agent'
        client = NgpVan::Client.new(configuration)
        expect(client.config.user_agent).to eq('test agent')
      end
    end
  end
end
