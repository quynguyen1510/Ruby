require 'test_helper'

class ExampleControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get example_home_url
    assert_response :success
  end

  test "should get help" do
    get example_help_url
    assert_response :success
  end

end
