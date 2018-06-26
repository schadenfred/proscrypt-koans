require 'test_helper'

describe "\nchapter 2 koans \n\n" do

  i_suck_and_my_tests_are_order_dependent!

  def koan_msg(msg, hint=nil)
    message {
      "\n\n\tKoan 2.#{self.name.split("_")[1].to_i}:
      \n\t#{msg}\n\n\t#{hint}
      \n\n\......." }
  end

  it "must generate initializer file" do
    assert File.exist?("config/initializers/devise.rb"), koan_msg(
        "There is no devise initializer or locale file. Generate them like so:",
        "$ bin/rails generate devise:install"
      )
  end

  it "must set devise secret key" do
    file = 'config/initializers/devise.rb'
    file_contents = File.read(file)
    code = "# config.secret_key"
    assert file_contents.match(code).nil?, koan_msg(
      "Devise needs a secret key. Open 'config/initializers/devise.rb' and remove the '#' character to uncomment the line:",
      "# config.secret_key = ...")
  end

  it "must configure ActionMailer for development" do
    file = 'config/environments/development.rb'
    file_contents = File.read(file)
    code = "config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }"
    assert file_contents.match(code), koan_msg(
      "ActionMailer has not been configured in development.",
      "reflect: https://github.com/plataformatec/devise#starting-with-rails")
  end

  it "must generate a user model" do
    assert File.exist?("app/models/user.rb"), koan_msg(
      "There is no user model at app/models/user.rb. Use Devise to generate one:",
      "$ bin/rails g devise User && bin/rails db:migrate")
  end

  it "must have converted views from .erb to .haml" do
    refute File.exist?('app/views/layouts/application.html.erb'), koan_msg(
      "Life is too short for ugly code. Convert your application layout from .erb to .haml.",
      "$ bundle exec rake haml:erb2haml")
  end

  it "must establish a root route in config/routes.rb" do

    file = 'config/routes.rb'
    file_contents = File.read(file)
    code = "root 'static#home'"

    assert file_contents.match(code), koan_msg(
      "When a user types 'www.proscrypt.com' in her browser and hits enter, her browser sends a 'request' to the our server, and then routes the request to application. In Rails, we customize some of this routing. Open 'config/routes.rb' and add this just above the last 'end' statement:",
      "#{code}")
  end

  it "must generate a static pages controller" do
    assert File.exist?("app/controllers/static_controller.rb"), koan_msg(
      "Now that we have a root route defined such that a request to 'www.proscrypt.com' goes to a controller named 'static' and an action inside that controller named 'home', let's go ahead and generate both:",
      "$ bin/rails g controller Static home ")
  end
end
