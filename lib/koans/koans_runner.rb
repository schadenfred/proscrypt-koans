require_relative 'koans_helper'

Dir.glob(Rails.root.join('lib/koans/*/koans/*.rb')).sort.each {|f| require f }
include Koans::Helper
include ANSI::Code
Minitest::Test.i_suck_and_my_tests_are_order_dependent!

module Minitest

  def self.__run reporter, options
      suites = Runnable.runnables.reject { |s| s.runnable_methods.empty? }
      parallel, serial = suites.partition { |s| s.test_order == :parallel }

      # If we run the parallel tests before the serial tests, the parallel tests
      # could run in parallel with the serial tests. This would be bad because
      # the serial tests won't lock around Reporter#record. Run the serial tests
      # first, so that after they complete, the parallel tests will lock when
      # recording results.
      serial.map { |suite| suite.run reporter, options } +
        parallel.map { |suite| suite.run reporter, options }
    end
end
# load 'koans_helper.rb'

# files = Dir.e/ntries("lib")
# Minitest.after_run do
#
# # after(:all) do
#   manifest = 'lib/koans/manifest.rb'
#   File.readlines(manifest).each do |line|
#     if line.match('# ')
#       byebug
#       uncomment = line.gsub("# ", "")
#       return
#     end
#     File.open(manifest, "w") {|file| file << uncomment }
#
#     puts green "uncomment line 2 in lib/koans/manifests.rb"
#   end
# #   # after_tests
# #
# end

# filename = "foo"
# text = File.read(manifest)
# content = text.gsub(/search_regexp/, "replacestring")
# File.open(filename, "w") { |file| file << content }

# file_names = ['foo.txt', 'bar.txt']
#
# file_names.each do |file_name|
#   text = File.read(file_name)
#   new_contents = text.gsub(/search_regexp/, "replacement string")
#
#   # To merely print the contents of the file, use:
#   puts new_contents
#
#   # To write changes to the file, use:
#   File.open(file_name, "w") {|file| file.puts new_contents }
# end
