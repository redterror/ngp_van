# frozen_string_literal: true

require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'ngp_van'
require 'faker'

Dir[File.dirname(__FILE__) + '/support/**/*.rb'].each { |f| require f }
