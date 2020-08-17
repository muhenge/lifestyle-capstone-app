require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'should get login' do
    get sessions_login_url
    assert_response :success
  end

  test 'should get check' do
    get sessions_check_url
    assert_response :success
  end

  test 'should get destroy' do
    get sessions_destroy_url
    assert_response :success
  end
end
