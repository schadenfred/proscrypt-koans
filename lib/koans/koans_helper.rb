module KoansHelper

  def default_koan_message
    "Find the line in the test file listed below and fix it, so that it matches our actual code."
  end

  def koan_header
    koan_number = self.name.split("_")[1].to_i.to_s
    "Koan #{@koans.chapter}.#{@koans.group}.#{@koans.name}"
  end

  def reference_code(file)
    reference_file = file.split("/").last + ".example"
    File.read("test/lib/koans/#{@koans.chapter}/reference_code/#{reference_file}")
  end

  def koan_yaml(file)
    refdir = "test/lib/koans/#{@koans.chapter}/reference_code/"

    reference_file = refdir + file + '.yml'
    yaml = YAML.load_file(reference_file)
  end

  def koan_yaml_expected_code(file)
    koan_yaml(file)["expected"]["code"]
  end

  def koan_command(command, suggested_commands=nil)
    suggested_commands ||= []
    if command.class == Array
      command.each do |comm|
        koan_command(comm, suggested_commands)
      end
    else
      suggested_commands << "\n\n  $ #{command}"
    end
    "Command:" + suggested_commands.join("\n\nFollowed by:")
  end

  def koan_code(options)
    instruction = "Open this file: \n\n  #{options[:file]}"
    instruction << "\n\nAdd this code"
    instruction << " " + options[:placement] if options[:placement]
    instruction + ":\n\n" + options[:code]
  end

  def koan_replace(options)
    yaml = options[:yaml]
    newline = "\n\n"
    instructions = ["Open this file:"]
    instructions << "#{options[:file]}"
    yaml.each do |line, code|
      instructions << "Replace this code on line #{line}:"
      instructions << code.first
      instructions << "...with this code:"
      instructions << code.second
    end

    instructions.join(newline)
  end

  def koan(msg=nil, options=nil)
    body = [(msg = msg ? msg : default_koan_message)]
    body << koan_code(options) if options[:code]
    body << koan_replace(options) if options[:yaml]
    body << koan_command(options[:command]) if options[:command]
    body << "Reflect:\n\n  #{options[:reflect]}" if options[:reflect]
    message { ["", body, "...."].join("\n\n") }
  end
end
