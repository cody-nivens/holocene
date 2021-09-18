require 'test_helper'

class HoloceneEventsNewHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @holocene_event= holocene_events(:holocene_event_1)
    @chapter = chapters(:chapter_1)

    @user = users(:users_1)
    sign_in @user
  end

  test "should get new" do
    get new_holocene_event_url
    assert_response :success

    assert_select "a[text()=?]",'Back'
    assert_select "a[href=?]", holocene_events_path
    assert_select ".footer>div>a", 1
    assert_template 'holocene_events/new'
  end
end
