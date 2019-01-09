require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  test "login with invalid" do
  	# check login url
    get login_path
    assert_template 'sessions/new'
    # with invalid infor render url new
    post login_path, params: { session: { email: "", password: "" } }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?	
  end
  
end
