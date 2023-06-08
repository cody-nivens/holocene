# frozen_string_literal: true

require 'application_system_test_case'

class EventTypesTest < ApplicationSystemTestCase
  setup do
    @event_type = event_types(:Impact)
    @user = users(:users_1)
    sign_in @user
  end

  test "drive the event_type cycle" do
    drive_cycle('Support', 'Event Types')
  end

  if 1 == 0
  test 'event_types edit' do
    visit edit_event_type_url(@event_type)
#    visit Show
    assert_link 'Show'
    click_on 'Show'
    assert_link 'Timeline'
    assert_current_path event_type_path(@event_type)
    click_on 'Back'
    assert_text 'Volcanic'
    assert_current_path event_types_path
  end

  test 'event_types geo_map' do
    visit geo_map_event_type_url(@event_type)
#    visit Display
    assert_link 'Display'
    click_on 'Display'
    assert_link 'Timeline'
    assert_current_path event_type_path(@event_type)
    click_on 'Back'
    assert_link 'New Event Type'
    assert_current_path event_types_path
  end

  test 'event_types index' do
    visit event_types_url
#    visit New Event Type
    assert_link 'New Event Type'
    click_on 'New Event Type'
    assert_no_link 'New Event Type'
    assert_current_path new_event_type_path
    click_on 'Back'
    assert_link 'New Event Type'
    assert_current_path event_types_path
  end

  test 'event_types show edit' do
    visit event_type_url(@event_type)
#    visit Edit
    within '.footer' do
      assert_link 'Edit'
      click_on 'Edit'
    end
    assert_link 'Show'
    assert_current_path edit_event_type_path(@event_type)
    click_on 'Back'
    assert_link 'Edit'
    assert_current_path event_type_path(@event_type)
  end

  test 'event_types show map' do
#    visit Map
    visit event_type_url(@event_type)
    assert_link 'Map'
    click_on 'Map'
    assert_selector '#world-map'
    assert_current_path geo_map_event_type_path(@event_type)
    click_on 'Back'
    assert_text @event_type.name
    assert_current_path event_type_path(@event_type)
  end

  test 'event_types show timeline' do
#    visit Timeline
    visit event_type_url(@event_type)
    assert_link 'Timeline'
    click_on 'Timeline'
    assert_link 'Display'
    assert_current_path event_type_timeline_path(@event_type)
    click_on 'Back'
    assert_text @event_type.name
    assert_current_path event_type_path(@event_type)
  end

  test 'creating an Event type' do
    visit event_types_url
    click_on 'New Event Type'

    fill_in 'Name', with: @event_type.name
    fill_in_rich_text_area 'event_type_body', with: 'Test 1'
    click_on 'Create Event type'

    assert_text 'Event type was successfully created'
    click_on 'Back'
  end

  test 'should not create an Event type' do
    visit event_types_url
    click_on 'New Event Type'

    fill_in 'Name', with: ''
    click_on 'Create Event type'

    assert_text "can't be blank"

    fill_in 'Name', with: @event_type.name
    click_on 'Create Event type'
    assert_text 'Event type was successfully created'
    click_on 'Back'
  end
end
end
