require 'minitest/fail_fast'
require 'test_helper'
require './lib/koans/koans_helper'
require './lib/koans/koans_minitest'
require './lib/koans/koans_reporter'
require './lib/koans/koans_reporter'

Minitest::Reporters.use! Minitest::Reporters::KoansReporter.new
Minitest::Test.i_suck_and_my_tests_are_order_dependent!

include Koans::Helper

Dir.glob(Rails.root.join('lib/koans/*/koans/*.rb')).sort.each {|f| require f }
