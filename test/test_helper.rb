ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'minitest/autorun'
require 'minitest/spec'
require 'minitest/given'
Dir[File.expand_path('test/support/*.rb')].each { |file| require file }

include TestMatchers
include KoansHelper::Koans
include FileManipulationTestHelper

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
