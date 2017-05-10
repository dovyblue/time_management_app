require 'test_helper'

class TimeManagementAppControllerTest < ActionDispatch::IntegrationTest
  test "should get about" do
    get time_management_app_about_url
    assert_response :success
  end

end
