require 'ruby-progressbar'
require 'minitest/reporters/base_reporter'

module Minitest

  if VERSION == "5.11.3"
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

  module Reporters
    class KoansReporter < BaseReporter
     include RelativePosition
     include ANSI::Code

     PROGRESS_MARK = '='

     def initialize(options = {})
       super
       @detailed_skip = options.fetch(:detailed_skip, true)

       @progress = ProgressBar.create({
         total:          total_count,
         starting_at:    count,
         progress_mark:  green(PROGRESS_MARK),
         remainder_mark: ' ',
         format:         options.fetch(:format, '  %C/%c: [%B] %p%% %a, %e'),
         autostart:      false
       })
     end

     def start
       super
       @progress.start
       @progress.total = total_count
       show
     end

     def record(test)
       super
       return if test.skipped? && !@detailed_skip
       if test.failure
         print "\e[0m\e[1000D\e[K"
         print_koan_with_time(test)
         puts white test.failure
         puts
       end

       if test.skipped? && color != "red"
         self.color = "yellow"
       elsif test.failure
         self.color = "red"
       end

       show
     end

     def report
        super
        puts
        # print green "Congratulations on finishing this section of koans. To start the next one, uncomment the second line in lib/koans/"
      end


     private

     def show
       @progress.increment unless count == 0

     end

     def test_class(result)
       if result.respond_to? :klass
         result.klass
       else
         result.class
       end
     end

     def print_koan_with_time(test)
       koan_file = test.source_location.to_s.split("/")
       chapter = "Chapter #{koan_file[-3]}"
       group = koan_file.last.split(".rb").first.split("_")
       group_number = "Group #{group.shift}"
       group_name = group.map(&:capitalize).join(" ")
       number = test.name.split("_")[1].to_i.to_s
       koan_name = test.name.split("_").last.gsub(/^./, &:upcase)
       puts
       puts "#{[chapter, group_number, group_name].join(" / ")}"
       puts "\n\n"
       puts cyan "Koan #{number} of #{total_count}: #{koan_name}"
     end

     def color
       @color ||= "green"
     end

     def color=(color)
       @color = color
       @progress.progress_mark = send(:cyan, PROGRESS_MARK)
     end
   end
 end
end
