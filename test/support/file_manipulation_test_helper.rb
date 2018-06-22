require 'byebug'

module FileManipulationTestHelper

  def file_exists?(directory, pattern=nil)
    directory_files = Dir["#{directory}**/*"]
    directory_files.each do |file|
      name = file.split("/").last
      if name.match pattern
        return true
      end
      false
    end
  end
end
