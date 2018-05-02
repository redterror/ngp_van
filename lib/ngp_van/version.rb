# frozen_string_literal: true

module NgpVan
  # Current major release.
  # @return [Integer]
  MAJOR = 0

  # Current minor release.
  # @return [Integer]
  MINOR = 1

  # Current patch level.
  # @return [Integer]
  PATCH = 4

  # Full release version.
  # @return [String]
  VERSION = [MAJOR, MINOR, PATCH].join('.').freeze
end
