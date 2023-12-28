# typed: false
# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'mocha/minitest'
require 'webmock/minitest'

module ActiveSupport
  class TestCase
    extend T::Sig

    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    private

    sig { params(name: String).returns(String) }
    def html_fixture(name)
      file_path = Rails.root.join('test', 'fixtures', 'html', "#{name}.html")
      File.read(file_path)
    end
  end
end
