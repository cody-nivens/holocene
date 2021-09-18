require 'test_helper'

class EventTypesEditHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @event_type= event_types(:Impact)

    @user = users(:users_1)
    sign_in @user
  end

  test "should get edit" do
    get edit_event_type_url(@event_type)
    assert_select "a[text()=?]",'Back'
    assert_response :success

    assert_select "a[text()=?]",'Show'
    assert_select "a[href=?]", event_type_path(@event_type)
    assert_select "a[text()=?]",'Back'
    assert_select "a[href=?]", event_type_path
    assert_select ".footer>div>a", 2
    assert_template 'event_types/edit'
  end
end
