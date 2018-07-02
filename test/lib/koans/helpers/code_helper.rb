module Koans::Helpers::CodeHelper

  def koan_msg(msg, file, options=nil)
    header = "Koan 2.#{self.name.split("_")[1].to_i}:"
    footer = "......."
    body = [msg + "."]
    if options[:indentation]
      indentation = options[:indentation] ? ", indented #{options[:indentation]}
                                             spaces" : nil
    end
    if options[:placement]
      body << "Code: Open .\/#{file} and add this code#{options[:placement]}#{indentation}:"
    end
    body << "#{options[:code]}" if options[:code]
    if (options[:command] && options[:placement])
      body << "...and then"
    end
    if options[:create_command]
      body << "Make this: '#{file}'}"
    end
    if options[:command]
      body << "Command: From your web container shell, do: \n\n  $ #{options[:command]}"
    end
    body << ".......\n\nreflect: #{options[:reflect]}" if options[:reflect]
    message { ["", header, body, footer].join("\n\n") }
  end

  def koan(msg, file, options={})
    code = options[:code]
    if code.nil?
      assert File.exist?(file), koan_msg(msg, file, options)
    else
      file_contents = File.read(file)
      if file_contents.eql?(code)
        assert file_contents.eql?(code), koan_msg( msg, file, options )
      else
        assert file_contents.match(code), koan_msg( msg, file, options )
      end
    end
  end
end
