module Minitest

  def self.__run reporter, options
    suites = Runnable.runnables.reject { |s| s.runnable_methods.empty? }
    parallel, serial = suites.partition { |s| s.test_order == :parallel }
    serial.map { |suite| suite.run reporter, options } +
      parallel.map { |suite| suite.run reporter, options }    end
end
