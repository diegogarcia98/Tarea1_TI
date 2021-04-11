require "test_helper"

class HomepageControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get homepage_index_url
    assert_response :success
  end

  test "should get new" do
    get homepage_new_url
    assert_response :success
  end

  test "should get show" do
    get homepage_show_url
    assert_response :success
  end

  test "should get edit" do
    get homepage_edit_url
    assert_response :success
  end

  test "should get update" do
    get homepage_update_url
    assert_response :success
  end
end
