describe "chapter 2 koans" do

  it "must have generated master key and credentials" do
    assert Rails.application.credentials.secret_key_base, koan(
      "Securing your application is imoprtant. We should generate a new master key and credentials set.",
      command: ["EDITOR=\"vi\" bin/rails credentials:edit", ":q"],
      reflect: "https://www.engineyard.com/blog/rails-encrypted-credentials-on-rails-5.2")
  end

  it "must generate initializer file" do
    file = "config/initializers/devise.rb"
    assert File.exist?(file), koan(
      "There is no devise initializer or locale file. We should generate them.",
      command: "bin/rails generate devise:install",
      reflect: "https://github.com/plataformatec/devise#getting-started"
    )
  end

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
    command: ["bin/rails g devise User", "bin/rails db:migrate"],
    reflect: "https://github.com/plataformatec/devise#getting-started")
  end

  it "must generate a valid users.yml fixture" do
    file = "test/fixtures/users.yml"
    code = reference_code(file)
    assert File.read(file).match(code), koan(
      "Devise does a lot of things we might not have thought about, like making sure people can't sign up without an email and a password, and can't sign up for multiple accounts using the same email. We will get Keanu-Reeves-deep in testing later but for now we need test users. Let's write fixtures to create test users for our tests.",
      file: file,
      code: code,
      placement: "replacing users 'one' and 'two' with")
  end
end
