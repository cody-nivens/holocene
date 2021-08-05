require "application_system_test_case"

class EventTypesTest < ApplicationSystemTestCase
  setup do
    @event_type = event_types(:Impact)
    @user = users(:users_1)
    sign_in @user
  end

  test "creating an Event type" do
    visit event_types_url
    click_on "New Event Type"

    fill_in "Name", with: @event_type.name
    fill_in_rich_text_area "event_type_body", with: "Test 1"
    click_on "Create Event type"

    assert_text "Event type was successfully created"
    click_on "Back"
  end

  test "should not create an Event type" do
    visit event_types_url
    click_on "New Event Type"

    fill_in "Name", with: ""
    click_on "Create Event type"

    assert_text "can't be blank"

    fill_in "Name", with: @event_type.name
    click_on "Create Event type"
    assert_text "Event type was successfully created"
    click_on "Back"
  end
end
