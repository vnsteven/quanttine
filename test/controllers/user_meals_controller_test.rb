require 'test_helper'

class UserMealsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_meals_index_url
    assert_response :success
  end

  test "should get create" do
    get user_meals_create_url
    assert_response :success
  end

  test "should get edit" do
    get user_meals_edit_url
    assert_response :success
  end

  test "should get update" do
    get user_meals_update_url
    assert_response :success
  end

  test "should get destroy" do
    get user_meals_destroy_url
    assert_response :success
  end

end
