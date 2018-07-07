ENV['RAILS_ENV'] ||= 'test'
Dir[File.expand_path('test/support/*.rb')].each { |f| require f }

require './config/environment'
require 'rails/test_help'
require 'minitest/autorun'

include Minitest::HandsomeMatchers
include FileManipulationTestHelper

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.

  fixtures :all

  # Add more helper methods to be used by all tests here...
end
