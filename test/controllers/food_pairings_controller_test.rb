require "test_helper"

class FoodPairingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get food_pairings_index_url
    assert_response :success
  end

  test "should get show" do
    get food_pairings_show_url
    assert_response :success
  end

  test "should get create" do
    get food_pairings_create_url
    assert_response :success
  end

  test "should get update" do
    get food_pairings_update_url
    assert_response :success
  end

  test "should get destroy" do
    get food_pairings_destroy_url
    assert_response :success
  end
end
