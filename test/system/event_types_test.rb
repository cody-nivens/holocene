require "application_system_test_case"

class EventTypesTest < ApplicationSystemTestCase
  setup do
    @event_type = event_types(:Impact)
    @user = users(:users_1)
    sign_in @user
  end

  test "visiting the index" do
    visit event_types_url
    assert_selector "h1", text: "Event Types"
    assert_link "New Event Type"
    assert_no_text "link_to"
  end

  test "visiting the map" do
    visit geo_map_event_type_url(@event_type)
    assert_link "Back"
    click_on "Back"
  end

  test "visiting the timeline" do
    visit event_type_timeline_url(@event_type)
    assert_text "Tunguska Event"
  end


  test "creating an Event type" do
    visit event_types_url
    click_on "New Event Type"

    fill_in "Name", with: @event_type.name
    page.execute_script("var wysihtml5Editor = $('#event_type_body').data('wysihtml5').editor;wysihtml5Editor.setValue('#{@event_type.body}')")
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

  test "updating an Event type" do
    visit event_types_url
    click_on "Edit", match: :first

    fill_in "Name", with: @event_type.name
    page.execute_script("var wysihtml5Editor = $('#event_type_body').data('wysihtml5').editor;wysihtml5Editor.setValue('#{@event_type.body}')")
    click_on "Update Event type"

    assert_text "Event type was successfully updated"
    click_on "Back"
  end

  test "should not update an Event type" do
    visit event_types_url
    click_on "Edit", match: :first

    fill_in "Name", with: ""
    click_on "Update Event type"

    assert_text "can't be blank"

    fill_in "Name", with: @event_type.name
    click_on "Update Event type"
    assert_text "Event type was successfully updated"
    click_on "Back"
  end

  test "destroying a Event type" do
    visit event_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Event type was successfully destroyed"
  end
end
