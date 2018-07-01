require 'test_helper'

describe "chapter 2 koans" do

  i_suck_and_my_tests_are_order_dependent!

  it "must have converted views from .erb to .haml" do
    koan(
      "Life is too short for ugly code like we get in 'app/views/layouts/application.html.haml'. Convert your application layout from .erb to .haml.",
      "app/views/layouts/application.html.haml",
      command: "bundle exec rake haml:erb2haml")
  end

  it "must establish a root route in config/routes.rb" do
    koan(
      "When a user enters 'www.some-awesome-domain.com' into her browser, it sends a request to the server at that name. If that server was running our application right now, it would send the request to our router, which would pass it along to the correct controller and action. We'll learn more about routes, controllers, and actions later but let's take a look at our current behavior, which we can see here: http://localhost:3000. Let's start changing this behavior by first defining a route",
      "config/routes.rb",
      code: "root 'static#home'",
      placement: " just above the last 'end' statement in the file")
  end

  it "must generate a static pages controller" do
    koan(
      "In the previous koan we established a root route in our routes.rb file that passes requests to the 'static' controller and the 'home' action inside it. Since this controller, view, and action don't yet exist, we should generate them, as well as a home.html.haml view file",
      "app/controllers/static_controller.rb",
      command: "bin/rails g controller Static home")
  end

  it "must have customized our landing page" do
    koan(
      "In the previous koan we generated a static controller and a home action which renders the content in app/views/static/home.html.haml. As you can see our application is now serving up the contents of our home view: http://localhost:3000. We should change that up some",
      "app/views/static/home.html.haml",
      placement: "",
      code: "%h1 Welcome to ProScrypt",
    )
  end

  it "must add gem to Gemfile" do
    koan(
      "We've added the devise gem to our Gemfile at about line 41, except it's
      the only gem listed in double quotes, making it unlike the others. Which
      is ugly. Style matters, especially when nobody is looking",
      "Gemfile",
      placement: " to replace the double-quotes",
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
      placement: " at around line 35",
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
      "Devise does a lot of things for us that we might not have thought about.  One of those things is making sure that people can't sign up without an  email address. Another is making sure that a person can't sign up for multiple accounts using the same email address. Our tests for devise rely  on test users we create just for our tests, and then destroy when we're done we've finished running them. We will use fixtures for our app",
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


  it "must have flash message partial" do
    koan(
      "Users need visual cues for when they've succeeded or failed at signing up or signing in. Let's create a directory named 'application' and a partial named '_flash_messages.html.haml'",
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
        "\s\s%li= link_to 'Sign in', new_user_session_path\n",
        "\s\s%li= link_to 'Sign up', new_user_registration_path\n"
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

  it "must test the user model" do
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
