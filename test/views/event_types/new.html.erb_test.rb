require 'test_helper'

class EventTypesNewHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @event_type= event_types(:Impact)

    @user = users(:users_1)
    sign_in @user
  end

  test "should get new" do
    get new_event_type_url
    assert_response :success

    assert_select "a[text()=?]",'Back'
    assert_select "a[href=?]", event_types_path
    assert_select ".footer>div>a", 1
    assert_template 'event_types/new'
  end
end
