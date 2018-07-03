require 'test_helper'
require 'lib/koans/koans_helper'
include KoansHelper

describe "chapter 2 koans" do

  i_suck_and_my_tests_are_order_dependent!

  before do
    @chapter = 2
  end

  it "must have geneated master key and credentials" do
    assert Rails.application.credentials.secret_key_base, koan(
      "Securing your application is imoprtant. We should generate a new master key and credentials set.",
      command: ["EDITOR=\"vi\" bin/rails credentials:edit", ":q"])
  end

  @proscrypt_gems = [

    [
      "'haml-rails', '~> 1.0'",
      "HTML is ugly with all those gross tags, and even uglier when we have to embed ruby inside it, which we're going to have to do a heck of a lot of. You can take my word for it, or look at the Jackson Pollock barf inside app/views/layouts/appliciation.erb. We should switch our view templating language to haml.",
      "https://github.com/indirect/haml-rails"
    ],
    [
      "'bootstrap', '~> 4.1.1'", "Nobody writes .css without a framework these days. We should use Bootstrap."
    ],
    [
      "'jquery-rails'", "We need jquery for Bootstrap"
    ],
    ["'devise'", "User authentication is a fascinating subject and you should learn as much about it as you can, and learn how to handle it on your own, if you decide you like developing. However Devise, maintained by Plataformatec, is a terrific gem that lets us move fast and will keep us from making too many bad decisions."
    ]
  ]

  @proscrypt_gems.each do |gem, suggestion, reflect|

    it "must have added #{gem} to Gemfile" do
      file = "Gemfile"
      code = "gem #{gem}"
      assert File.read(file).match(code), koan(
        suggestion,
        file: file,
        code: code,
        placement: "just below line 39 and then run 'bundle' from inside your web container shell",
        command: "bundle",
        reflect: reflect
      )
    end
  end


  it "must have converted views from .erb to .haml" do
    file = "app/views/layouts/application.html.haml"
    assert File.exist?(file), koan(
      "Life is too short for ugly code like we read in #{file}'. We should convert our application layout view from .erb to .haml.",
      file: file,
      command: "bundle exec rake haml:erb2haml",
      reflect: "http://haml.info/tutorial.html")
  end

  it "must establish a root route in config/routes.rb" do
    file = "config/routes.rb"
    code = reference_code(file)
    assert File.read(file).match(code), koan(
      "When a user enters 'www.some-awesome-domain.com' into her browser, it sends a request to the server at that name. If that server was running our application right now it would send the request to our router, which would pass it along to the correct controller and action. We'll learn more about routes, controllers and actions later but let's take a look at our current behavior, which is the default Rails new application landing page: http://localhost:3000. Let's change this. First, let's define a root route:",
      file: file,
      code: code,
      reflect: "http://edgeguides.rubyonrails.org/routing.html")
  end

  it "must generate a static pages controller" do
    file = "app/controllers/static_controller.rb"
    assert File.exist?(file), koan(
      "In the previous koan we established a root route in routes.rb that passes requests to the 'static' controller and the 'home' action inside it. Since this controller, view, and action don't yet exist, we should generate them, as well as a home.html.haml view.",
    command: "bin/rails g controller Static home",
    reflect: "http://guides.rubyonrails.org/command_line.html#rails-generate")
  end

  it "must have customized our landing page" do
    file = "app/views/static/home.html.haml"
    code = reference_code(file)
    assert File.read(file).match(code), koan(
      "In the previous koan we generated a static controller and a home action which renders the content in app/views/static/home.html.haml. As you can see our application is now serving up the contents of our home view: http://localhost:3000. We should change that up some",
      file: file,
      code: code
    )
  end

  it "must generate initializer file" do
    file = "config/initializers/devise.rb"
    assert File.exist?(file), koan(
      "There is no devise initializer or locale file. We should generate them.",
      command: "bin/rails generate devise:install",
      reflect: "https://github.com/plataformatec/devise#getting-started"
    )
  end

  # it "must set devise secret key" do
  #   file = "config/initializers/devise.rb"
  #   code = "  config.secret_key"
  #   assert File.read(file).match(code), koan(
  #     "Devise needs a secret key.",
  #     code: code,
  #     placement: "and uncomment the code at about line 11 -- by removing the prepended '#'",
  #   reflect : )
  # end

  it "must configure ActionMailer for development" do
    file = "config/environments/development.rb"
    code = reference_code(file)
    assert File.read(file).match(code), koan(
      "ActionMailer has not been configured for our development environment.",
      file: file,
      code: code,
      placement: " at around line 35",
      reflect: "https://github.com/plataformatec/devise#getting-started")
  end

  it "must generate a user model" do
    file = "app/models/user.rb"
    assert File.exist?(file), koan(
      "There is no user model. We should generate one using devise.",
    command: "bin/rails g devise User && bin/rails db:migrate",
    reflect: "https://github.com/plataformatec/devise#getting-started")
  end

  it "must generate a valid users.yml fixture" do
    file = "test/fixtures/users.yml"
    code = reference_code(file)
    assert File.read(file).match(code), koan(
      "Devise does a lot of things for us that we might not have thought about.  One of those things is making sure that people can't sign up without an  email address. Another is making sure that a person can't sign up for multiple accounts using the same email address. Our tests for devise rely  on test users we create just for our tests, and then destroy when we're done we've finished running them. We will use fixtures for our app",
      code: code,
      placement: ", replacing users 'one' and 'two' with"
    )

  end

  it "must have flash message partial" do
    file = "app/views/application/_flash_messages.html.haml"
    assert File.exist?(file), koan(
      "Users need visual cues for when they've succeeded or failed at signing up or signing in. We should enable flash messages at the top of the screen.",
    command: ["mkdir -p app/views/application", "touch #{file}"],
    reflect: "http://edgeguides.rubyonrails.org/layouts_and_rendering.html#using-partials")
  end

  it "must have flash message partial" do
    file = "app/views/application/_flash_messages.html.haml"
    code = reference_code(file)
    assert File.read(file).match(code), koan(
      "We have the partial view, but no code",
      code: code,
      reflect: "http://haml.info/tutorial.html"
    )
  end

  it "must have auth links partial" do
    file = "app/views/application/_auth_links.html.haml"
    assert File.exist?(file), koan(
      "Our users need links to signup, sign in, and sign out. Let's make a partial to put that code in",
    command: "touch #{file}",
    reflect: "http://edgeguides.rubyonrails.org/layouts_and_rendering.html#using-partials")
  end

  it "must have code in auth_links" do
    file = "app/views/application/_auth_links.html.haml"
    code = reference_code(file)
    assert File.exist?(file), koan(
      "Our users need links to signup, sign in, and sign out. Let's make a partial to put that code in.",
    file: file,
    code: code,
    # placement: " inside",
    reflect: "http://haml.info/tutorial.html")
  end

  it "must include flash and auth_links partials in application.html.haml" do
    file = "app/views/layouts/application.html.haml"
    code = reference_code(file)

    assert File.read(file).match(code), koan(
      "Partials are rendered as part of parent views and layouts. Include our
      partial in our application layout",
    file: file,
    code: code,
    reflect: "http://edgeguides.rubyonrails.org/layouts_and_rendering.html#structuring-layouts")
  end

  it "must have proscrypt stylesheet" do
    file = "app/assets/stylesheets/proscrypt.scss"
    assert File.exist?(file), koan(
      "We should have a stylesheet for our styles.",
      command: "touch app/assets/stylesheets/proscrypt.scss"
    )
  end

  it "must have styles in proscrypt stylesheet" do
    file = "app/assets/stylesheets/proscrypt.scss"
    code = reference_code(file)
    assert File.read(file).eql?(code), koan(
      "We should include bootstrap in our stylesheets",
      file: file,
      code: code)
  end

  it "must use .scss instead of .css" do
    file = "app/assets/stylesheets/application.scss"
    assert File.exist?(file), koan(
      "We should use .scss instead of .css because it's prettier.",
      command: "mv app/assets/stylesheets/application.css #{file}",
      reflect: "https://sass-lang.com/guide")
  end

  it "must configure application.scss" do
    file = "app/assets/stylesheets/application.scss"
    code = reference_code(file)
    assert File.read(file).match(code), koan(
      "We should import our styles into our application manifest.",
      file: file,
      code: code,
      reflect: "https://github.com/twbs/bootstrap-rubygem"
    )
  end

  it "must have a footer partial" do
    file = "app/views/application/_footer.html.haml"
    code = reference_code(file)
    assert File.exist?(file), koan(
      "We should have a footer.",
      command: " touch app/views/application/_footer.html.haml",
      file: file,
      code: code
    )
  end
end
