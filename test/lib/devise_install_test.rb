require 'test_helper'

describe "\nchapter 2 koans \n\n" do

  i_suck_and_my_tests_are_order_dependent!

  def koan_msg(msg, hint=nil)
    message {
      "\n\tKoan 2.#{self.name.split("_")[1].to_i}:\n\n\t#{msg}\n\n\t#{hint}
      \n\n\......." }
  end

  it "must add devise to Gemfile" do
    File.read('Gemfile').must_include "gem \'devise\'", koan_msg(
      "There is no gem called \'devise'\ in the Gemfile. Add it now.",
      "reflect: https://bundler.io/man/gemfile.5.html")
  end

  it "must run '$ bundle' to install Devise gem" do

    File.read('Gemfile').must_include "gem \'devise\'", koan_msg(
      "the 'devise' gem is not listed in Gemfile.lock. Add it now:",
      "$ bundle" )
  end

  it "must create initializer file" do
    assert File.exist?("config/initializers/devise.rb"), koan_msg(
        "There is no devise initializer or locale file. Add them like so:",
        "$ rails generate devise:install"
      )
  end

  it "must configure devise mailer for development" do
    file = 'config/environments/development.rb'
    file_contents = File.read(file)
    code = "config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }"
    file_contents.must_include code, koan_msg(
      "ActionMailer has not been configured in development.",
      "reflect: https://github.com/plataformatec/devise#starting-with-rails"
    )
  end

  it "must generate a user model" do
    assert File.exist?("app/models/user.rb"), koan_msg(
      "There is no user model at app/models/user.rb. Use Devise to generate one:",
      "$ rails g devise User")
  end

  # it "must run devise migration" do
  #   ActiveRecord::Base.connection.tables.must_include "users", koan_msg(
  #     "Your db has no USERS table.",
  #     "$ rails db:migrate")
  # end

  it "must establish a root route in config/routes.rb" do

    file = 'config/routes.rb'
    file_contents = File.read(file)
    code = "root 'static#home'"

    file_contents.must_include code, koan_msg(
      "We need a root route.",
      "Open #{file} and add #{code}")
  end

  it "must generate a static pages controller" do
    assert File.exist?("app/controllers/static_controller.rb"), koan_msg(
      "We need a controller to handle our static pages.",
      "$ rails g controller Static home about contact terms privacy")
  end
end
