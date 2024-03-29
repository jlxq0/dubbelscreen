# require 'test_helper'

# class PeopleControllerTest < ActionController::TestCase
#   setup do
#     @person = people(:one)
#     @user = users(:one)
#   end

#   test "should get index" do
#     get :index, user_id: 1
#     assert_response :success
#     assert_not_nil assigns(:people)
#   end

#   test "should get new" do
#     get :new, user_id: 1
#     assert_response :success
#   end

#   test "should create person" do
#     assert_difference('Person.count') do
#       post :create, person: { birthday: @person.birthday, fullname: @person.fullname, name: @person.name, user_id: @person.user_id, withings_id: @person.withings_id, withings_key: @person.withings_key, withings_secret: @person.withings_secret }
#     end

#     assert_redirected_to person_path(assigns(:person))
#   end

#   test "should show person" do
#     get :show, id: @person, user_id: 1
#     assert_response :success
#   end

#   test "should get edit" do
#     get :edit, id: @person, user_id: 1
#     assert_response :success
#   end

#   test "should update person" do
#     patch :update, id: @person, person: { birthday: @person.birthday, fullname: @person.fullname, name: @person.name, user_id: @person.user_id, withings_id: @person.withings_id, withings_key: @person.withings_key, withings_secret: @person.withings_secret }
#     assert_redirected_to person_path(assigns(:person))
#   end

#   test "should destroy person" do
#     assert_difference('Person.count', -1) do
#       delete :destroy, id: @person
#     end

#     assert_redirected_to people_path
#   end
# end
