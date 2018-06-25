ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'minitest/autorun'
require 'minitest/nyan_cat'
require 'minitest/reporters'


# require 'byebug'
# require 'shoulda'

Dir[File.expand_path('test/support/*.rb')].each { |file| require file }

include TestMatchers
include FileManipulationTestHelper

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

reporter_options = {
  color: false,
  fast_fail: true
}
Minitest::Reporters.use! [Minitest::Reporters::ProgressReporter.new(fail_fast: true)]
