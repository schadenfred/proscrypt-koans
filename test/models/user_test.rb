require 'test_helper'

describe User do

  subject { User }

  let(:chapter) { 3 }

  describe "db" do

    let(:koan_file) { __FILE__.split("app/").last }
<<<<<<< HEAD
    # let(:koan_message) { self.class.name }
    # let(:koan_message) { "replace 'koan' with the column type" }
=======
    # let(:koan_message) { "replace 'koan' with the column type" }
    let(:koan_message) { self.class.name }
>>>>>>> 8edfac759c2346a4eef8f13004823c783ae8c477
    # let(:koan_message)

    describe "columns & types" do
it " " do
      must_have_column(:email, koan_message)
      # must_have_column(:encrypted_password, koan)
      # must_have_column(:reset_password_token, koan)
      # must_have_column(:reset_password_sent_at, koan)
      # must_have_column(:remember_created_at, koan)
      # must_have_column(:sign_in_count, koan)
      # must_have_column(:current_sign_in_at, koan)
      # must_have_column(:last_sign_in_at, koan)
      # must_have_column(:current_sign_in_ip, koan)
      # must_have_column(:last_sign_in_ip, koan)
      # must_have_column(:created_at, koan)
      # must_have_column(:updated_at, koan)
end
    end

    specify "indexes" do

      # must_have_index(:email)
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

  specify "methods" do
    # subject.new.respond_to?(:articles).must_equal true
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
