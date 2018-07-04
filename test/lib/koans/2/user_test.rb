# require 'test_helper'
# require 'lib/koans/helpers/model_tests_helper'
# include Koans::Helpers::ModelTestsHelper
#
# describe User do
#
#   subject { User }
#
#   describe "db" do
#
#     def must_have_column(column, type)
#       subject.columns_hash[column.to_s].type.must_equal type, koan_message(
#         "If we look at db/schema.rb, we see that devise has given us a users table and a number of columns. Let's rewrite our tests to show we know they're there:"
#       )
#     end
#
#     let(:expected) { "replace me" }
#
#     specify "columns & types" do
#
#       # must_have_column(:email, expected)
#       # must_have_column(:encrypted_password, expected)
#       # must_have_column(:reset_password_token, expected)
#       # must_have_column(:reset_password_sent_at, expected)
#       # must_have_column(:remember_created_at, expected)
#       # must_have_column(:sign_in_count, expected)
#       # must_have_column(:current_sign_in_at, expected)
#       # must_have_column(:last_sign_in_at, expected)
#       # must_have_column(:current_sign_in_ip, expected)
#       # must_have_column(:last_sign_in_ip, expected)
#       # must_have_column(:created_at, expected)
#       # must_have_column(:updated_at, expected)
#     end
#
#     def must_have_index(index)
#       connection = ActiveRecord::Base.connection
#       indexes = connection.indexes(subject.table_name).collect(&:columns)
#       indexes.must_include [index.to_s], koan_message(
#         "Indexes on database tables greatly improve speed which will be helpful when we have billions of prescriptions in our database and milions of users. Our database currently has two indexes on the users table, which we can verify by looking at db/schema.rb. Let's make our tests specify these indexes as well.")
#     end
#
#     specify "indexes" do
#
#       must_have_index(:email)
#       # must_have_index(expected)
#     end
#   end
# end
