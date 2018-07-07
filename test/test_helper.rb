ENV['RAILS_ENV'] ||= 'test'
Dir[File.expand_path('test/support/*.rb')].each { |f| require f }

require './config/environment'
require 'rails/test_help'
require 'minitest/autorun'


class ActiveSupport::TestCase

  include Minitest::HandsomeMatchers
  include FileManipulationTestHelper

  fixtures :all

  # Add more helper methods to be used by all tests here...
end
