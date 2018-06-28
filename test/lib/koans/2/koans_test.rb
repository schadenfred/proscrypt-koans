require 'test_helper'

describe "chapter 2 koans" do

  i_suck_and_my_tests_are_order_dependent!

  def koan_msg(msg, file, options=nil)
    header = "Koan 2.#{self.name.split("_")[1].to_i}:"
    footer = "......."
    body = [msg + "."]
    if options[:indentation]
      indentation = options[:indentation] ? ", indented #{options[:indentation]}
                                             spaces" : nil
    end
    if options[:placement]
      body << "Code: Open .\/#{file} and add this code#{options[:placement]}#{indentation}:"
    end
    body << "#{options[:code]}" if options[:code]
    if (options[:command] && options[:placement])
      body << "...and then"
    end
    if options[:create_command]
      body << "Make this: '#{file}'}"
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
      if file_contents.eql?(code)
        assert file_contents.eql?(code), koan_msg( msg, file, options )
      else
        assert file_contents.match(code), koan_msg( msg, file, options )
      end
    end
  end

  it "must add gem to Gemfile" do
    koan(
      "When we want to use an existing package or library, known as a 'gem' to a Ruby on Rails application, we add it to our application's Gemfile.",
      "Gemfile",
      placement: "to replace the existing double-quoted 'gem \"devise\"' specification around line 41, because style matters -- especially when nobody is looking",
      code: "gem 'devise'",
      reflect: "https://bundler.io/gemfile.html"
    )
  end

  it "must generate initializer file" do
    koan(
      "There is no devise initializer or locale file for devise",
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
      placement: "and uncomment the code at about line 11 -- by removing the prepended '#'")
  end

  it "must configure ActionMailer for development" do
    koan(
      "ActionMailer has not been configured.",
      "config/environments/development.rb",
      code: "config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }",
      placement: "at around line 35",
      reflect: "https://github.com/plataformatec/devise#getting-started")
  end

  it "must generate a user model" do
    koan(
      "There is no user model at app/models/user.rb.",
      "app/models/user.rb",
      command: "bin/rails g devise User && bin/rails db:migrate")
  end

  it "must generate a valid users.yml fixture" do
    koan(
      "Devise does a lot of things for us that we might not have thought about.
      One of those things is making sure that people can't sign up without an
      email address. Another is making sure that a person can't sign up for
      multiple accounts using the same email address. Our tests for devise rely
      on test users we create just for our tests, and then destroy when we're
      done we've finished running them. We will use fixtures for our app.",
      "test/fixtures/users.yml",
      code: ["one:",
        "\n\s\semail: user@test.com",
        "\npatient:",
        "\n\s\semail: patient@test.com",
        "\noptometrist:",
        "\n\s\semail: optometrist@test.com",
        "\noptician:",
        "\n\s\semail: optician@test.com",

      ].join,
      placement: ", replacing users 'one' and 'two' with"
    )

  end

  it "must have converted views from .erb to .haml" do
    koan(
      "Life is too short for ugly code. Convert your application layout from .erb to .haml.",
      "app/views/layouts/application.html.haml",
      command: "bundle exec rake haml:erb2haml")
  end

  it "must establish a root route in config/routes.rb" do
    koan(
      "When a user types 'www.proscrypt.com' in her browser and hits enter, her browser sends a 'request' to the our server. The server passes the request to our router.",
      "config/routes.rb",
      code: "root 'static#home'",
      placement: " just above the last 'end' statement in the file")
  end

  it "must generate a static pages controller" do
    koan(
      "In the previous koan we established a root route that sends requests to
      www.proscrypt.com to the 'static' controller and the 'home' action inside
      it, which would render a view for the 'home' page. This controller, the
      action, and the html view do not yet exist",
      "app/controllers/static_controller.rb",
      command: "bin/rails g controller Static home")
  end

  it "must have flash message partial" do
    koan(
      "Users need visual cues for when they've succeeded or failed at signing
      up or signing in. Let's create a directory named 'application'
      and a partial named '_flash_messages.html.haml'",
      "app/views/application/_flash_messages.html.haml",
      create_command: true)
  end

  it "must have flash message partial" do
    koan(
      "We have the partial view, but no code",
      "app/views/application/_flash_messages.html.haml",
      code: [
        "%p.notice\n",
        "\s\s= notice\n",
        "%p.alert\n",
        "\s\s= alert"].join,
      placement: ", with the indentation required for haml",
      reflect: "http://haml.info/tutorial.html"
    )
  end

  it "must include flash partial in application.html.haml" do
    koan(
      "Partials are rendered as part of parent views and layouts. Include our
      partial in our application layout",
      "app/views/layouts/application.html.haml",
      code: ["\s\s%body\n",
        "\s\s\s\s= render 'flash_messages'\n"].join,
      placement: " just below the '%body' tag and indented exactly four spaces")
  end

  it "must have auth links partial" do
    koan(
      "Our users need links to signup, sign in, and sign out. Let's make a
      partial to put that code in",
      "app/views/application/_auth_links.html.haml",
      create_command: true)
  end

  it "must have code in auth_links" do
    koan(
      "Our users need links to signup, sign in, and sign out. Let's make a
      partial to put that code in",
      "app/views/application/_auth_links.html.haml",
      code: [
        "- if user_signed_in?\n",
        "\s\s%li= link_to 'home', root_path\n",
        "\s\s%li= link_to 'sign out \#{current_user.email}', destroy_user_session_path, method: 'delete'\n",
        "- else\n",
        "\s\s%li= link_to 'Sign in', new_user_session_path\n"
      ].join,
    placement: " inside")

  end

  it "must include auth_links partial in application.html.haml" do
    koan(
      "Include our partial in our application layout",
      "app/views/layouts/application.html.haml",
      code: [
        "\s\s%body\n",
        "\s\s\s\s= render 'flash_messages'\n",
        "\s\s\s\s= render 'auth_links'\n",
        "\s\s\s\s= yield"].join,
      placement: ", around line 11, between our flash_messages partial and our yield block")
  end
end
