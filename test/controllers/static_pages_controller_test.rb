require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get help" do
    get :help
    assert_response :success
  end

  test "should get dash1" do
    get :dash1
    assert_response :success
  end

  test "should get dash2" do
    get :dash2
    assert_response :success
  end

end
