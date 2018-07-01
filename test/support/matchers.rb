module TestMatchers

  def message_wrapper(message=nil, suggestion=nil)
    if koan_message.nil?
      message { "\n\t#{message}\n\n\t\t#{suggestion}\n" }
    else
      koan_chapter = "Koan #{chapter}."
      koan_number = self.name.split("_")[1].to_i.to_s
      header = koan_chapter + koan_number
      # footer = [self.name, self.class_name].join(" |")
      body = [koan_message]
      message { ["", header, body].join("\n\n") }
    end
  end

  def must_respond_to(method)
    s = subject
    s.respond_to?(method).must_equal true
  end

  def wont_respond_to(method)
    s = subject.new
    s.respond_to?(method).must_equal false
  end

  def must_have_column(column, type=nil)
    table = subject.table_name.upcase + " table"
    msg = "#{table} doesn't have an \'#{column}\' column. To generate it:"
    sugg = "$ rails g migration Add#{column.to_s.capitalize + "To" + subject.table_name.capitalize} #{column}:string"
    subject.column_names.must_include column.to_s, message_wrapper(msg, sugg)
    if type.nil?
      subject.columns_hash[column.to_s].type.must_equal :string, message_wrapper("Is this column a 'string' type?")
    else
      subject.columns_hash[column.to_s].type.must_equal type, message_wrapper("Is '#{column.to_s}' supposed to be of '#{type}' type?")
    end
  end

  def wont_have_column(column, type)
    subject.columns_hash[column.to_s].type.wont_equal type
  end

  def must_have_index(index)
    connection = ActiveRecord::Base.connection
    indexes = connection.indexes(subject.table_name).collect(&:columns)

    if index.class == Symbol
      indexes.must_include [index.to_s], message_wrapper()
    else
      indexes.must_include(index.map &:to_s)
    end
  end

  def must_have_multiple_index(index)
    connection = ActiveRecord::Base.connection
    connection.indexes(subject.table_name)
      .collect(&:columns.to_sym)
      .must_include(index.map &:to_s)
  end

  def wont_have_index(index)
    connection = ActiveRecord::Base.connection
    connection.indexes(subject).collect(&:columns).wont_include([index])
  end

  def must_belong_to(parent_model)
    subject.reflect_on_all_associations(:belongs_to).map(&:name).must_include parent_model
  end

  def must_have_one(model)
    subject.reflect_on_all_associations(:has_one).map(&:name).must_include model
  end

  def wont_belong_to(parent_model)
    subject.reflections[parent_model.to_sym].macro.wont_equal :belongs_to
  end

  def must_have_many(child_model)

    subject.reflect_on_all_associations(:has_many).map(&:name).must_include child_model
  end

  def wont_have_many(model)
    subject.reflections[child_model].macro.wont_equal :has_many
  end
end
