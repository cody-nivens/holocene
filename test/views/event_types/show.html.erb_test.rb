require 'test_helper'

class EventTypesShowHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @event_type= event_types(:Impact)

    @user = users(:users_1)
    sign_in @user
  end

  test "should show event_type" do
    get event_type_path(@event_type)
    assert_response :success

    assert_select "a[text()=?]",'Edit'
    assert_select "a[href=?]", edit_event_type_path(@event_type)
    assert_select "a[text()=?]",'Back'
    assert_select ".footer>div>a", 4
    assert_template 'event_types/show'
  end
end
