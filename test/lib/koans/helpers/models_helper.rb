module Koans::Helpers::ModelsHelper

  def base_koan_message
    "Find the line in the test file listed below and fix it, so that it matches our actual code."
  end

  def koan_message(msg=nil, file=nil, options=nil)
    header = "Koan 3.#{self.name.split("_")[1].to_i}:"
    footer = "......."
    if msg.nil?
      msg = base_koan_message
    end
    # body = [msg + "."]
    # if options[:indentation]
    #   indentation = options[:indentation] ? ", indented #{options[:indentation]}
    #                                          spaces" : nil
    # end
    # if options[:placement]
    #   body << "Code: Open .\/#{file} and add this code#{options[:placement]}#{indentation}:"
    # end
    # body << "#{options[:code]}" if options[:code]
    # if (options[:command] && options[:placement])
    #   body << "...and then"
    # end
    # if options[:create_command]
    #   body << "Make this: '#{file}'}"
    # end
    # if options[:command]
    #   body << "Command: From your web container shell, do: \n\n  $ #{options[:command]}"
    # end
    # body << ".......\n\nreflect: #{options[:reflect]}" if options[:reflect]
    message { ["", header, msg, footer].join("\n\n") }
  end

  def must_have_column(column, type=nil)
    if type.nil?
      subject.columns_hash[column.to_s].type.must_equal :string, message { koan_message("") }
    else
      subject.columns_hash[column.to_s].type.must_equal type, koan_message
    end
    # subject.column_names.must_include column.to_s, message(@koan_message)
    subject.column_names.must_include column.to_s, @koan_message
  end


end
