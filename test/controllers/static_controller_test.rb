require 'test_helper'

class StaticControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_home_url
    assert_response :success
  end

  # test "should get about" do
  #   get static_about_url
  #   assert_response :success
  # end
  #
  # test "should get contact" do
  #   get static_contact_url
  #   assert_response :success
  # end
  #
  # test "should get terms" do
  #   get static_terms_url
  #   assert_response :success
  # end
  #
  # test "should get privacy" do
  #   get static_privacy_url
  #   assert_response :success
  # end
  #
  # test "should get help" do
  #   get static_help_url
  #   assert_response :success
  # end

end
