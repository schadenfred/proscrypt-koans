module Koans::Helpers::ControllerTestsHelper

  include Koans::Helpers::BaseHelper

  def koan(msg=nil, options=nil)
    header = "Koan 3.3 -- Controller Tests"
    body = []
    footer = "......."
    if msg.nil?
      msg = base_koan_message
    else
      msg = msg + "  " + base_koan_message
    end
    body << msg

    if options && options[:reflect]
      body << "\nreflect: #{options[:reflect]}"
    end
    message { ["", header, body, footer].join("\n\n") }
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
