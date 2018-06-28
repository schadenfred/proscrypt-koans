module Guard
  class KoanFiles

    attr_reader :chapter, :watchable

    def initialize(chapter)
      @chapter = chapter
      @watchable = YAML.load_file("test/lib/koans/#{chapter}/watchable.yml")
    end
  end
end
