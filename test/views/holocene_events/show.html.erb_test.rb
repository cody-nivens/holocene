require 'test_helper'

class HoloceneEventsShowHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @holocene_event= holocene_events(:holocene_event_1)

    @user = users(:users_1)
    sign_in @user
  end

  test "should show holocene_event" do
    get holocene_event_path(@holocene_event)
    assert_response :success

    assert_select "a[text()=?]",'Edit'
    assert_select "a[href=?]", edit_holocene_event_path(@holocene_event)
    assert_select "a[text()=?]",'Back'
    assert_select ".footer>div>a", 4
    assert_template 'holocene_events/show'
  end
end
