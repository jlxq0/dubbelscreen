# require 'test_helper'

# class NewschannelsControllerTest < ActionController::TestCase
#   setup do
#     @newschannel = newschannels(:one)
#     @user = users(:one)
#   end

#   test "should get index" do
#     get :index, user_id: 1
#     assert_response :success
#     assert_not_nil assigns(:newschannels)
#   end

#   test "should get new" do
#     get :new, user_id: 1
#     assert_response :success
#   end

#   test "should create newschannel" do
#     assert_difference('Newschannel.count') do
#       post :create, newschannel: { feedurl: @newschannel.feedurl, name: @newschannel.name, user_id: @newschannel.user_id }
#     end

#     assert_redirected_to newschannel_path(assigns(:newschannel))
#   end

#   test "should show newschannel" do
#     get :show, id: @newschannel, user_id: 1
#     assert_response :success
#   end

#   test "should get edit" do
#     get :edit, id: @newschannel, user_id: 1
#     assert_response :success
#   end

#   test "should update newschannel" do
#     patch :update, id: @newschannel, newschannel: { feedurl: @newschannel.feedurl, name: @newschannel.name, user_id: @newschannel.user_id }
#     assert_redirected_to newschannel_path(assigns(:newschannel))
#   end

#   test "should destroy newschannel" do
#     assert_difference('Newschannel.count', -1) do
#       delete :destroy, id: @newschannel
#     end

#     assert_redirected_to newschannels_path
#   end
# end
