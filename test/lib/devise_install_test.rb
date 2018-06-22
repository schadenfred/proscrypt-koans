require 'test_helper'

describe "Devise Install" do

  i_suck_and_my_tests_are_order_dependent!

  it "must add devise to Gemfile" do
    File.read('Gemfile').must_include "gem \'devise\'", message {
      "There is no gem called \'devise'\ in the Gemfile. Add it now." }
  end

  it "must create initializer file" do
    assert File.exist?("config/initializers/devise.rb"),
      message {
        "There is no devise initializer or locale file. Add them like so:
        \n\n\t$ rails generate devise:install"
      }
  end

  it "must configure devise mailer for development" do
    file = 'config/environments/development.rb'
    file_contents = File.read(file)
    code = "config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }"
    file_contents.must_include code, message {
      "ActionMailer has not been configured for the development. Please open #{file} and add the line:
        \n\n\t #{code}"
    }
  end

  it "must generate a user model" do
    assert File.exist?("app/models/user.rb"),
      message {
        "There is no user model. Generate one with devise with:
          \n\n\t$ rails g devise User"
      }
  end

  it "must run devise migration" do
    must_have_table("users")
  end
end
