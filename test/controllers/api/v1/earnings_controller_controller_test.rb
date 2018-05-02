require 'test_helper'

class Api::V1::EarningsControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_earnings_controller_index_url
    assert_response :success
  end

  test "should get create" do
    get api_v1_earnings_controller_create_url
    assert_response :success
  end

  test "should get show" do
    get api_v1_earnings_controller_show_url
    assert_response :success
  end

  test "should get update" do
    get api_v1_earnings_controller_update_url
    assert_response :success
  end

  test "should get update" do
    get api_v1_earnings_controller_update_url
    assert_response :success
  end

end
