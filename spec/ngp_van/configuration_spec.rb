# frozen_string_literal: true

require 'spec_helper'

module NgpVan
  RSpec.describe Configuration do
    before(:each) { NgpVan.configuration.reset! }
    after(:each) { NgpVan.configuration.reset! }

    describe '#api_endpoint' do
      context 'when no api_endpoint is specified' do
        it 'sets a default value' do
          expect(NgpVan.configuration.api_endpoint)
            .to eq(NgpVan::Default.api_endpoint)
        end
      end

      context 'when a custom value is specified' do
        let(:url) { Faker::Internet.url }

        before do
          NgpVan.configure do |config|
            config.api_endpoint = url
          end
        end

        it 'returns the custom value' do
          expect(NgpVan.configuration.api_endpoint).to eq(url)
        end
      end
    end

    describe '#api_key' do
      context 'when no api_key is specified' do
        it 'sets a default value' do
          expect(NgpVan.configuration.api_key)
            .to eq(NgpVan::Default.api_key)
        end
      end

      context 'when a custom value is specified' do
        let(:key) { Faker::Internet.password }

        before do
          NgpVan.configure do |config|
            config.api_key = key
          end
        end

        it 'returns the custom value' do
          expect(NgpVan.configuration.api_key).to eq(key)
        end
      end
    end

    describe '#application_name' do
      context 'when no application name is specified' do
        it 'sets a default value' do
          expect(NgpVan.configuration.application_name)
            .to eq(NgpVan::Default.application_name)
        end
      end

      context 'when a custom value is specified' do
        let(:name) { Faker::Company.name }

        before do
          NgpVan.configure do |config|
            config.application_name = name
          end
        end

        it 'returns the custom value' do
          expect(NgpVan.configuration.application_name).to eq(name)
        end
      end
    end

    describe '#inspect' do
      it 'masks the application name' do
        application_name = Faker::Company.name
        NgpVan.configuration.application_name = application_name
        expect(NgpVan.configuration.inspect).to_not include(application_name)
      end

      it 'masks the api key' do
        api_key = Faker::Internet.password
        NgpVan.configuration.api_key = api_key
        expect(NgpVan.configuration.inspect).to_not include(api_key)
      end
    end

    describe '#user_agent' do
      context 'when no user_agent is specified' do
        it 'sets a default value' do
          expect(NgpVan.configuration.user_agent)
            .to eq(NgpVan::Default.user_agent)
        end
      end

      context 'when a custom value is specified' do
        let(:agent) { 'Web Spider v123' }

        before do
          NgpVan.configure do |config|
            config.user_agent = agent
          end
        end

        it 'returns the custom value' do
          expect(NgpVan.configuration.user_agent).to eq(agent)
        end
      end
    end
  end
end
