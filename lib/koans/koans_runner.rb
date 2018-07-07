require_relative 'koans_helper'

Dir.glob(Rails.root.join('lib/koans/**/*.rb')).sort.each {|f| require f }

include Koans::Helper

Minitest::Reporters.use! Minitest::Reporters::KoansReporter.new
Minitest::Test.i_suck_and_my_tests_are_order_dependent!
