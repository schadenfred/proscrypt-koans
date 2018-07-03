require 'test_helper'
require 'lib/koans/koans_helper'
include KoansHelper

describe "chapter 2 koans" do

  i_suck_and_my_tests_are_order_dependent!

  before do
    @koan_chapter = __dir__.split("/").last
    @koan_group = __FILE__.split("/").last.split("_").first
  end

  it "must have converted views from .erb to .haml" do
    file = "app/views/layouts/application.html.haml"
    assert File.exist?(file), koan(
      "Life is too short for ugly code like we read in #{file}'. We should convert our application layout view from .erb to .haml.",
      file: file,
      command: "bundle exec rake haml:erb2haml",
      reflect: "http://haml.info/tutorial.html")
  end

  it "must have a pretty looking application layout" do
    file = "app/views/layouts/application.html.haml"
    code = reference_code(file)
    assert File.read(file).match(code), koan(
      "Our application layout is awfully busy, as the interior decorators might say. Let's reorganize it so it calls header, main, and footer partials. Keep in mind that with haml, indentation matters.",
      file: file,
      code: code,
      placement: "right around line 10",
      reflect: "http://edgeguides.rubyonrails.org/layouts_and_rendering.html#using-partials")
    end

    it "must have app/views/application directory" do
      file = "app/views/application"
      assert Dir.exist?(file), koan(
        "Rails looks for partials first in the same directory as parent view, and then it looks in app/views/application. We should create that directory.",
        command: "mkdir -p app/views/application",
        reflect: "http://edgeguides.rubyonrails.org/layouts_and_rendering.html#using-partials")
    end

    it "must have _header partial" do
      file = "app/views/application/_header.html.haml"
      assert File.exist?(file), koan(
        "We should have a _header partial",
        command: "touch app/views/application/_header.html.haml",
        reflect: "http://edgeguides.rubyonrails.org/layouts_and_rendering.html#using-partials")
    end

    it "must have _header content" do
      file = "app/views/application/_header.html.haml"
      code = reference_code(file)
      assert File.read(file).match(code), koan(
        "We should have a good looking header.",
        file: file,
        code: code)
    end

    it "must have auth links partial" do
      file = "app/views/application/_auth_links.html.haml"
      assert File.exist?(file), koan(
        "Our users need links to signup, sign in, and sign out. Let's make a partial to put that code in",
      command: "touch #{file}",
      reflect: "http://edgeguides.rubyonrails.org/layouts_and_rendering.html#using-partials")
    end

    it "must have _auth_links partial" do
      file = "app/views/application/_auth_links.html.haml"
      code = reference_code(file)
      assert File.read(file).eql?(code), koan(
        "We should put those links inside our _auth_links partial.",
        file: file,
        code: code)
    end

  it "must have flash message partial" do
    file = "app/views/application/_flash_messages.html.haml"
    assert File.exist?(file), koan(
      "Users need visual cues for when they've succeeded or failed at signing up or signing in. We should enable flash messages at the top of the screen.",
    command: "touch #{file}",
    reflect: "http://edgeguides.rubyonrails.org/layouts_and_rendering.html#using-partials")
  end

  it "must have code in flash message partial" do
    file = "app/views/application/_flash_messages.html.haml"
    code = reference_code(file)
    assert File.read(file).match(code), koan(
      "We have the partial view, but no code",
      code: code,
      reflect: "http://haml.info/tutorial.html")
  end

  it "must include _flash in _header" do
    file = "app/views/application/_header.html.haml"
    code = reference_code(file)

    assert File.read(file).match(code), koan(
      "Partials are rendered as part of parent views and layouts. Include our partial in our application layout",
    file: file,
    code: code,
    reflect: "http://edgeguides.rubyonrails.org/layouts_and_rendering.html#structuring-layouts")
  end

  it "must include _auth_links in _header" do
    file = "app/views/application/_header.html.haml"
    code = "render 'auth_links'"
    assert File.read(file).match(code), koan(
      "Partials can be rendered inside partials. Let's put our _auth_links partial inside our _header partial, which is already inside our application layout.",
    file: file,
    code: code,
    reflect: "http://edgeguides.rubyonrails.org/layouts_and_rendering.html#structuring-layouts")
  end

  it "must have a _main partial" do
    file = "app/views/application/_main.html.haml"
    assert File.exist?(file), koan(
      "We should have a _main partial.",
      command: "touch #{file}",
      file: file
    )
  end

  it "must have yield block in _main partial" do
    file = "app/views/application/_main.html.haml"
    code = reference_code(file)
    assert File.read(file).eql?(code), koan(
      "We should have code in our main partial with a 'yield' block that renders pages like our home page inside the application layout.",
      file: file,
      code: code)
  end

  it "must have a footer partial" do
    file = "app/views/application/_footer.html.haml"
    code = reference_code(file)
    assert File.exist?(file), koan(
      "We should have a footer.",
      command: " touch app/views/application/_footer.html.haml",
      file: file,
      code: code)
  end

  it "must refactor application layout" do
    file = "app/views/application/_head.html.haml"
    assert File.exist?(file), (
      "We should make our application layout pretty by refactoring all that stuff between the %head and %body tags into a partial called _head and calling it in the layout.")
  end

  it "must refactor application layout" do
    file = "app/views/application/_head.html.haml"
    code = reference_code(file)
    assert File.read(file).eql?(code), koan(
      "Looks like the code in #{file} isn't quite right.",
      file: file,
      code: code
    )
  end

  it "must include _head partial in application layout" do
    file = "app/views/layouts/application.html.haml"
    code = "= render 'head'"
    assert File.read(file).match(code), koan(
      "Did you include the head partial in the application layout?",
      file: file,
      code: code,
      placement: "just below the %head tag, indented two spaces from the %head tag and four spaces from the left margin"
    )
  end

  it "must remove duplicate code fromo application layout" do
    file = "app/views/layouts/application.html.haml"
    code = reference_code(file)
    assert File.read(file).eql?(code), koan(
      "Did you remove all the code and replace it with the partial?",
      file: file,
      code: code
    )
  end
end
