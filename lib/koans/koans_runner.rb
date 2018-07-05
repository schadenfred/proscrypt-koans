module Koans
  class Runner

    attr_reader :chapter, :watchable, :group, :name, :number

    def initialize(test_file_self=nil, file=nil)
      @chapter = file.split("/")[-3]
      @group = file.split("/").last.split("_").first
      @name = file.split("/").last.split(".").first.gsub("_", " ")
    end
  end
end
