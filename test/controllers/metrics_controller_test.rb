require 'test_helper'

class MetricsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @metric = metrics(:metric_1)
    @user = users(:users_1)
    sign_in @user
  end

  test "should get index" do
    get metrics_url
    assert_response :success
  end

  test "should show metric" do
    get metric_url(@metric)
    assert_response :success
  end
end
