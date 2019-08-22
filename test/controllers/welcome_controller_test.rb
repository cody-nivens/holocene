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

  test 'assert_react_component' do
    get "/"
    assert_equal 200, response.status

    # assert rendered react component and check the props
#    assert_react_component "HelloWorld" do |props|
#      assert_equal "Hello from react-rails.", props[:greeting]
#      assert_equal "react-rails", props[:info][:name]
#      assert_select "[class=?]", "hello-world"
#    end

    # or just assert component rendered
#    assert_react_component "HelloWorld"
  end
end
