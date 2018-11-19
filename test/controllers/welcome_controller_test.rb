require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest

  setup do
    @user = users(:users_1)
    sign_in @user
  end

  test "should get index" do
    get welcome_index_url
    assert_response :success
  end

end
