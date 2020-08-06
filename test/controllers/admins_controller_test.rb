require 'test_helper'

class AdminsControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get admins_login_url
    assert_response :success
  end

  test "should get check" do
    get admins_check_url
    assert_response :success
  end

  test "should get destroy" do
    get admins_destroy_url
    assert_response :success
  end

end
