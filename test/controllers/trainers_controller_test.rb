require 'test_helper'

class TrainersControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get trainers_login_url
    assert_response :success
  end

  test "should get info" do
    get trainers_info_url
    assert_response :success
  end

  test "should get trainee" do
    get trainers_trainee_url
    assert_response :success
  end

  test "should get events" do
    get trainers_events_url
    assert_response :success
  end

end
