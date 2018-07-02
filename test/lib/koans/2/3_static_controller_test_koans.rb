require 'test_helper'
require 'lib/koans/koans_helper'
include Koans::Helpers::ControllerTestsHelper

class StaticControllerTest < ActionDispatch::IntegrationTest

  i_suck_and_my_tests_are_order_dependent!

  test "should get home page with www.proscrypt.com/static/home" do

    get '/static/home'

    assert_response 200, koan(
      "If you hit http://localhost:3000/static/home in your browser, you'll see the same page as our root, except explicitly nested under static/home. As before, the code for a successful response is 200.")
  end

  test "should get home page with www.proscrypt.com" do

    get '/'
    assert_response 200, koan(
      "If you hit http://localhost:3000 in your browser, our application successfully responds with our root view, the one in static/home.html.haml. The code for a successful response is 200.",
    reflect: "http://guides.rubyonrails.org/layouts_and_rendering.html")
  end

  test "should get home page using helper" do

    get static_home_url

    assert_response 200, koan(
      "There are different ways to write tests. In rails you don't have to use relative urls, as in the previous examples. Instead you can use rails url helpers, such as the one we called in this test, 'static_home_url'. Instead of using the 200 code for success, you can also use the symbol :success.",
    reflect: "http://guides.rubyonrails.org/layouts_and_rendering.html")
  end
end
