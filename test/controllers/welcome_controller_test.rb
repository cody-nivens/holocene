require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest

  setup do
    @user = users(:one)
    sign_in @user
  end

  test "should get index" do
    get welcome_index_url
    assert_response :success
  end

end
