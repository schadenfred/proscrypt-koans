require 'test_helper'
include KoansHelper::Model

describe User do

  subject { User }

  let(:chapter) { 3 }

  let(:koan_message) { "Find the test file and failing test inside it and change the test code, so that the behavior we're specifying in our tests matches application behavior." }

  describe "db" do

    let(:expected) { "replace me" }

    def must_have_column(column, type=nil)
      subject.column_names.must_include column.to_s, message(koan_message)
    end

    specify "columns & types" do


      # subject.column_names.must_include column.to_s, message_wrapper(msg, sugg)

      must_have_column(:email, expected)
      # must_have_column(:encrypted_password, expected)
      # must_have_column(:reset_password_token, expected)
      # must_have_column(:reset_password_sent_at, expected)
      # must_have_column(:remember_created_at, expected)
      # must_have_column(:sign_in_count, expected)
      # must_have_column(:current_sign_in_at, expected)
      # must_have_column(:last_sign_in_at, expected)
      # must_have_column(:current_sign_in_ip, expected)
      # must_have_column(:last_sign_in_ip, expected)
      # must_have_column(:created_at, expected)
      # must_have_column(:updated_at, expected)
    end

    specify "indexes" do
      # must_have_index(:fixme)
      # must_have_index(:name)
      # must_have_index(:reset_password_token)
      # must_have_index([:invited_by_id, :invited_by_type])
    end
  end

  specify "associations" do

    # must_belong_to(:plan)
    # must_have_many(:articles)
    # must_have_many(:identities)
    # must_have_many(:invitations)
    # must_have_many(:positions)
    # must_have_many(:photographed)
    # must_have_many(:reviews)
    # must_have_many(:wishes)
    #
    # must_have_one(:avatar)
  end

  specify "devise modules" do
    s = subject
    # s.methods(false).must_equal true
    subject.devise_modules.must_include "database_authenticatable", message { koan_message }
    # subject.new.respond_to?(:avatar).must_equal true

  end

  # Given(:user) { build_stubbed(:user, email: email, name: realname) }
  #
  # Given(:realname) { nil }
  #
  # describe ":name_from_email" do
  #
  #   describe "localpart separated by period" do
  #
  #     When(:email) { "narcy.david@gmail.com"}
  #     Then { user.name_from_email.must_equal "Narcy" }
  #   end
  #
  #   describe "localpart separated by underscore" do
  #
  #     When(:email) { "narcy_david@gmail.com"}
  #     Then { user.name_from_email.must_equal "Narcy" }
  #   end
  #
  #   describe "localpart separated by underscore" do
  #
  #     When(:email) { "narcydavid@gmail.com"}
  #     Then { user.name_from_email.must_equal "Narcydavid" }
  #   end
  #
  #   Given(:email) { "narcy.david@gmail.com" }
  #
  #   describe ":first_name" do
  #
  #     describe "when name attribute not blank" do
  #
  #       When(:realname) { "Narciso Davidovich" }
  #       Then{ user.first_name.must_equal "Narciso"}
  #     end
  #
  #     describe "when name attribute nil" do
  #
  #       When(:realname) { nil }
  #       Then { user.first_name.must_equal "Narcy"}
  #     end
  #   end
  # end
end
