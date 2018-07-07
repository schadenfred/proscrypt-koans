require 'ruby-progressbar'
require 'minitest/reporters/base_reporter'

module Minitest

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
         print_koan(test)
         puts test.failure
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

     def print_koan(test)
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
       puts "Koan #{number} of #{total_count}: #{koan_name}"
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
