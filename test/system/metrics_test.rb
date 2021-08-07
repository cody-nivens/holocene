require "application_system_test_case"

class MetricsTest < ApplicationSystemTestCase
  setup do
    @metric = metrics(:metric_1)
    @user = users(:users_1)
    sign_in @user
  end

  test "visiting the index" do
    visit metrics_url
    assert_selector "h1", text: "Metrics"
  end
end
