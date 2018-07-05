require "rails/test_unit/runner"
# namespace :test do
namespace :koans do
  desc "Chapter 2"
  task chapter_2: :environment do
    # sh('ruby -I test test/lib/koans/chapter_2/koans/1_bundle_gems_test.rb')
# ')
    # sh('rails test test/lib/koans/chapter_2/koans/1_bundle_gems_test.rb')
    # $: << "test"
    test_files = FileList[Dir.entries('test/lib/koans/chapter_2/koans')]
    Rails::TestUnit::Runner.run(test_files)
    # # Rails::TestUnit::Runner.load_tests([test_files])
  end

  desc "TODO"
  task chapter_3: :environment do
    desc "Run only the tests in the `test/features` directory"
    task :features  => "test:prepare" do
      $: << "test"
      Rails::TestUnit::Runner.run("test/lib/koans/chapter_2/koans")
    end
  end

  desc "TODO"
  task chapter_4: :environment do
  end

  desc "TODO"
  task chapter_5: :environment do
  end

end
# end
