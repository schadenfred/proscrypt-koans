
describe "chapter 2 koans" do

  i_suck_and_my_tests_are_order_dependent!

  before do
    @koan_chapter = __dir__.split("/").last
    @koan_group = __FILE__.split("/").last.split("_").first
  end

  it "must establish a root route in config/routes.rb" do
    file = "config/routes.rb"
    code = "  root 'static#home'"
    assert File.read(file).match(code), koan(
      "When a user enters 'www.some-awesome-domain.com' into her browser, it sends a request to the server at that name. If that server was running our application right now it would send the request to our router, which would pass it along to the correct controller and action. We'll learn more about routes, controllers and actions later but let's take a look at our current behavior, which is the default Rails new application landing page: http://localhost:3000. Let's change this. First, let's define a root route:",
      file: file,
      code: code,
      placement: "just above the last 'end' statement",
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
      code: code)
  end
end
