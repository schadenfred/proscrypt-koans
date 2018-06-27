require 'test_helper'

describe "\nchapter 2 koans \n\n" do

  i_suck_and_my_tests_are_order_dependent!

  def koan_msg(msg, file, options=nil)
    header = "Koan 2.#{self.name.split("_")[1].to_i}:"
    footer = "......."
    body = [msg]
    if options[:indentation]
      indentation = options[:indentation] ? ", indented #{options[:indentation]}
                                             spaces" : nil
    end
    if options[:placement]
      body << "Code: Open your .\/#{file} and add this code #{options[:placement]}#{indentation}:"
    end
    body << "  #{options[:code]}" if options[:code]
    if (options[:command] && options[:placement])
      body << "...and then"
    end
    if options[:command]
      body << "Command: From your web container shell, do: \n\n  $ #{options[:command]}"
    end
    body << ".......\n\nreflect: #{options[:reflect]}" if options[:reflect]
    message { ["", header, body, footer].join("\n\n") }
  end

  def koan(msg, file, options={})
    code = options[:code]
    if code.nil?
      assert File.exist?(file), koan_msg(msg, file, options)
    else

      file_contents = File.read(file)
      assert file_contents.match(code), koan_msg( msg, file, options )
    end
  end

  it "must generate initializer file" do
    koan(
      "There is no devise initializer or locale file.",
      "config/initializers/devise.rb",
      command: "bin/rails generate devise:install",
      reflect: "https://github.com/plataformatec/devise#getting-started"
    )
  end

  it "must set devise secret key" do
    koan(
      "Devise needs a secret key.",
      "config/initializers/devise.rb",
      code: "  config.secret_key",
      placement: "and uncomment the code at about line 11 (by removing the lead '#')"

    )
  end

  it "must configure ActionMailer for development" do
    koan(
      "ActionMailer has not been configured.",
      "config/environments/development.rb",
      code: "config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }",
      placement: "at around line 35",
      reflect: "https://github.com/plataformatec/devise#getting-started"
    )
  end

  it "must generate a user model" do
    koan(
      "There is no user model at app/models/user.rb.",
      "app/models/user.rb",
      command: "bin/rails g devise User && bin/rails db:migrate"
    )
  end

  it "must have converted views from .erb to .haml" do
    koan(
      "Life is too short for ugly code. Convert your application layout from .erb to .haml.",
      "app/views/layouts/application.html.erb",
      command: "bundle exec rake haml:erb2haml"
    )
    # refute File.exist?('app/views/layouts/application.html.erb'), koan_msg(
    #   "Life is too short for ugly code. Convert your application layout from .erb to .haml.",
    #   "$ bundle exec rake haml:erb2haml")
  end

  # it "must establish a root route in config/routes.rb" do
  #
  #   file = 'config/routes.rb'
  #   file_contents = File.read(file)
  #   code = "root 'static#home'"
  #
  #   assert file_contents.match(code), koan_msg(
  #     "When a user types 'www.proscrypt.com' in her browser and hits enter, her browser sends a 'request' to the our server, and then routes the request to application. In Rails, we customize some of this routing. Open 'config/routes.rb' and add this just above the last 'end' statement:",
  #     "#{code}")
  # end
  #
  # it "must generate a static pages controller" do
  #   assert File.exist?("app/controllers/static_controller.rb"), koan_msg(
  #     "Now that we have a root route defined such that a request to 'www.proscrypt.com' goes to a controller named 'static' and an action inside that controller named 'home', let's go ahead and generate both:",
  #     "$ bin/rails g controller Static home ")
  # end
  #
  # it "must have flash message partial" do
  #   assert File.exist?("app/views/application/_flash_messages.html.haml"), koan_msg(
  #     "Our users need to see notices and flash messages for successes and failures, for example when they successfully log in. Let's create a partial to put our code in:",
  #     "$ mkdir app/views/shared\n\n\t$ touch app/views/application/_flash_messages.html.haml")
  # end
  #
  # it "must include flash partial in application.html.haml" do
  #   file = File.read("app/views/layouts/application.html.haml")
  #   assert file.match("flash_messages"), koan_msg(
  #     "Include our partial in our application layout. Add this line beneath '%body' indented and just above '= yield':",
  #     "= render \'flash_messages\'")
  # end
  #
  # it "must have flash code" do
  #   file = File.read("app/views/application/_flash_messages.html.haml")
  #   assert file.match("= notice"), koan_msg(
  #     "put this code in 'app/views/application/_flash_messages.html.haml':",
  #     "%p.notice
  #         = notice
  #       %p.alert
  #         = alert")
  # end
  #
  # it "must have auth links partial" do
  #   assert File.exist?("app/views/application/_auth_links.html.haml"), koan_msg(
  #     "Our users need links to signup, sign in, and sign out.",
  #     "Create 'app/views/application/_auth_links.html.haml'")
  # end
  #
  # it "must include auth_links partial in application.html.haml" do
  #   file = File.read("app/views/layouts/application.html.haml")
  #   assert file.match("render 'auth_links'"), koan_msg(
  #     "Include our partial in our application layout. Add this line beneath '%body' indented and just above '= yield':",
  #     "= render \'auth_links\'")
  # end
  #
  # it "must have flash code" do
  #   file = File.read("app/views/application/_auth_links.html.haml")
  #   assert file.match("if user_signed_in"), koan_msg(
  #     "put this code in 'shared/_flash.html.haml':",
  #     "- if user_signed_in?
  #         %li= link_to 'home', root_path
  #         %li= link_to 'sign out \#{current_user.email}', destroy_user_session_path, method: 'delete'
  #       - else
  #         %li= link_to 'Sign in', new_user_session_path
  #         %li= link_to 'Sign up', new_user_registration_path")
  # end
end
