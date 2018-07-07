module Minitest

  class Koans

    def self.sort_koans
      if VERSION == "5.11.3"
        def Minitest.__run reporter, options
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
    end
  end
end
