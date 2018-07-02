module Koans::Helpers::ModelTestsHelper

  def koan_message(msg=nil, file=nil, options=nil)
    header = "Koan 3.#{self.name.split("_")[1].to_i}:"
    footer = "......."
    if msg.nil?
      msg = base_koan_message
    end
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
