require 'test_helper'

class Api::V1::SpendingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_spendings_index_url
    assert_response :success
  end

  test "should get new" do
    get api_v1_spendings_new_url
    assert_response :success
  end

  test "should get create" do
    get api_v1_spendings_create_url
    assert_response :success
  end

  test "should get delete" do
    get api_v1_spendings_delete_url
    assert_response :success
  end

  test "should get update" do
    get api_v1_spendings_update_url
    assert_response :success
  end

  test "should get show" do
    get api_v1_spendings_show_url
    assert_response :success
  end

end
