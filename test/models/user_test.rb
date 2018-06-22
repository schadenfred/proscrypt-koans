require 'test_helper'

describe User do

  i_suck_and_my_tests_are_order_dependent!

  subject { User }

  describe "db" do

    specify "columns & types" do

      must_have_column(:email, :inet)
      must_have_column(:encrypted_password)
      must_have_column(:reset_password_token)
      must_have_column(:reset_password_sent_at, :datetime)
      must_have_column(:remember_created_at, :datetime)
      must_have_column(:sign_in_count, :integer)
      must_have_column(:current_sign_in_at, :datetime)
      must_have_column(:last_sign_in_at, :datetime)
      must_have_column(:current_sign_in_ip, :inet)
      must_have_column(:last_sign_in_ip, :inet)
      must_have_column(:created_at, :datetime)
      must_have_column(:updated_at, :datetime)
    end

    specify "indexes" do

      must_have_index(:email)
      must_have_index(:reset_password_token)
    end
  end
end
