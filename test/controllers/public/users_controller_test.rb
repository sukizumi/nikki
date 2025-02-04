require "test_helper"

class Public::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get mypage" do
    get public_users_mypage_url
    assert_response :success
  end

  test "should get edit" do
    get public_users_edit_url
    assert_response :success
  end

  test "should get show" do
    get public_users_show_url
    assert_response :success
  end

  test "should get following" do
    get public_users_following_url
    assert_response :success
  end

  test "should get follower" do
    get public_users_follower_url
    assert_response :success
  end
end
