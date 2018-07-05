require 'test_helper'
require 'lib/koans/koans_helper'
include KoansHelper

describe "chapter 2 koans" do

  i_suck_and_my_tests_are_order_dependent!

  before do
    @koan_chapter = __dir__.split("/").last
    @koan_group = __FILE__.split("/").last.split("_").first
  end

  it "must install devise views" do
    directory = "app/views/devise"
    assert Dir.exist?(directory), koan(
      "Sign in and sign up forms are a little ugly. Devise hides its views in the gem, but we can copy them into our views folder to customize them. We should copy them over.",
      command: "bin/rails g devise:views")
  end

  it "must convert devise registrations#new to haml" do
    file = "app/views/devise/registrations/new.html.erb"
    refute File.exist?(file), koan(
      "Devise generates .erb views, and not .haml, which offends us. In previous koans, we converted them using the html2haml gem. Let's use that method again.",
      command: ["bundle exec html2haml #{file} #{file.gsub(".erb",".haml")}", "rm #{file}"])
  end

  it "must convert devise registrations#new to haml" do
    file = "app/views/devise/registrations/edit.html.erb"
    refute File.exist?(file), koan(
      "Another way to convert .erb, to haml is to use Jack Russell Software's conversion tool -- https://html2haml.herokuapp.com/. Copy the contents of #{file}, paste it into the html box of the site, convert it, grab the converted code, and paste it back into #{file} and then change its extension to .haml.",
      command: "mv #{file} #{file.gsub(".erb", ".haml")}",
      reflect: "http://www.jackrussellsoftware.com/")
  end

  it "must have correct indentation in haml views" do
    file = "app/views/devise/registrations/edit.html.haml"
    code = "%h2\n\s\sEdit \#{resource_name.to_s.humanize}"
    assert File.read(file).match(code), koan(
      "Doesn't look like the haml isn't quite right in #{file}. Haml is very sensitive to indentation, and needs you to use two spaces between levels instead of tabs.",
      command: "mv #{file} #{file.gsub(".erb", ".haml")}",
      reflect: "http://www.jackrussellsoftware.com/")
  end

  it "must convert all devise views from .erb to .haml" do
    directory = "app/views/devise/"
    files = Dir.glob(directory + "**/*")

    files.each do |file|
      refute file.match(".erb"), koan(
        "Another way to convert .erb to haml is to use the rake task supplied with the haml-rails gem. The following command will look into all of our directories, find all of our .erb view files -- using recursion -- and convert them to .haml.",
        command: "bundle exec rake haml:erb2haml",
        relect: "https://github.com/indirect/haml-rails")
    end
  end

  it "must apply bootstrap styles to registrations#new" do
    file = "app/views/devise/registrations/new.html.haml"
    yaml = koan_yaml("signup.html.haml")
    assert File.read(file).match(".field-group"), koan(
      "We should apply some bootstrap classes to our devise view elements. Let's with the sign up page.",
      file: file,
      yaml: yaml)
  end

  it "must apply bootstrap styles to sessions#new" do
    file = "app/views/devise/sessions/new.html.haml"
    yaml = koan_yaml("signin.html.haml")
    assert File.read(file).match(".field-group"), koan(
      "We should apply some bootstrap classes to our devise view elements. Let's with the sign up page.",
      file: file,
      yaml: yaml)
  end

  it "must apply bootstrap styles to all devise views" do

    directory = "app/views/devise/"
    files = Dir.glob(directory + "**/*.haml")

    files.each do |file|
      assert File.read(file).match(".field-group"), koan(
        "Adding bootstrap classes to .html files is tedious. Wouldn't it be great if there was a gem that could do it for us? I wasn't able to find one that worked, but I did find a repo where someone was half way toward getting it working, and copied his views into test/lib/koans/2/reference_code/devise. The only problem is that each of the files has a .example extension. You can either copy them over one by one from the reference_code directory, removing the extension each time, or you can write a script to do it for you.",
        command: "for file in test/lib/koans/2/reference_code/devise/**/*.haml.example ; do mv \"$file\" \"${file%.haml.example}.haml\" && mv test/lib/koans/2/reference_code/; done",
      reflect: "https://stackoverflow.com/questions/1224766/how-do-i-rename-the-extension-for-a-batch-of-files/1225236#1225236")
    end
  end
end
