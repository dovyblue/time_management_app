require 'test_helper'

class UserPreferencesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_preferences_new_url
    assert_response :success
  end

  test "should get show" do
    get user_preferences_show_url
    assert_response :success
  end

end
