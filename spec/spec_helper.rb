# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'ngp_van'
require 'faker'
require 'webmock/rspec'

include WebMock::API

Dir[File.dirname(__FILE__) + '/support/**/*.rb'].each { |f| require f }
