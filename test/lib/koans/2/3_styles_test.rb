require 'test_helper'
require 'lib/koans/koans_helper'
include KoansHelper

describe "chapter 2 koans" do

  i_suck_and_my_tests_are_order_dependent!

  before do
    @koan_chapter = __dir__.split("/").last
    @koan_group = __FILE__.split("/").last.split("_").first
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

  it "must configure manifest" do
    file = "app/assets/stylesheets/application.scss"
    code = reference_code(file)
    assert File.read(file).match(code), koan(
      "We should import our styles into our application manifest.",
      file: file,
      code: code,
      reflect: "https://github.com/twbs/bootstrap-rubygem")
  end
end
