require 'test_helper'

class PlexserversControllerTest < ActionController::TestCase
  setup do
    @plexserver = plexservers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:plexservers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create plexserver" do
    assert_difference('Plexserver.count') do
      post :create, plexserver: { movies_library: @plexserver.movies_library, name: @plexserver.name, port: @plexserver.port, shows_library: @plexserver.shows_library, token: @plexserver.token, url: @plexserver.url, user_id: @plexserver.user_id }
    end

    assert_redirected_to plexserver_path(assigns(:plexserver))
  end

  test "should show plexserver" do
    get :show, id: @plexserver
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @plexserver
    assert_response :success
  end

  test "should update plexserver" do
    patch :update, id: @plexserver, plexserver: { movies_library: @plexserver.movies_library, name: @plexserver.name, port: @plexserver.port, shows_library: @plexserver.shows_library, token: @plexserver.token, url: @plexserver.url, user_id: @plexserver.user_id }
    assert_redirected_to plexserver_path(assigns(:plexserver))
  end

  test "should destroy plexserver" do
    assert_difference('Plexserver.count', -1) do
      delete :destroy, id: @plexserver
    end

    assert_redirected_to plexservers_path
  end
end
