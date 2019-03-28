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

    describe '#valid_id?' do
      let(:client) { NgpVan::Client.new }

      context 'with a valid id' do
        it 'returns true' do
          expect(client.valid_id?(123)).to eq(true)
          expect(client.valid_id?('abc')).to eq(true)
          expect(client.valid_id?('abc-123')).to eq(true)
        end
      end

      context 'with an invalid id' do
        it 'returns false' do
          expect(client.valid_id?('fu?evil=mode')).to eq(false)
          expect(client.valid_id?('fu/bar')).to eq(false)
          expect(client.valid_id?('%20')).to eq(false)
        end
      end
    end

    describe '#verify_id' do
      let(:client) { NgpVan::Client.new }

      context 'with a single id' do
        context 'when valid' do
          it 'returns nil' do
            expect(client.verify_id(123)).to eq(nil)
          end
        end

        context 'when invalid' do
          it 'raises an error' do
            expect {
              client.verify_id('fu?evil=mode')
            }.to raise_error(NgpVan::InvalidID)
          end
        end
      end

      context 'with a list of ids' do
        context 'when valid' do
          it 'returns nil' do
            expect(client.verify_id('abc', 123, 'abc-123')).to eq(nil)
          end
        end

        context 'when invalid' do
          it 'raises an error' do
            expect {
              client.verify_id('abc', 'fu?evil=mode', 'abc-123')
            }.to raise_error(NgpVan::InvalidID)
          end
        end
      end
    end
  end
end
