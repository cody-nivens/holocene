require "application_system_test_case"

class HoloceneEventsTest < ApplicationSystemTestCase
  setup do
    @holocene_event = holocene_events(:holocene_event_1)
    file = Rails.root.join('test', 'fixtures', 'files', 'image.jpg')
    @holocene_event.image.attach(io: File.open(file), filename: 'image.jpg')
    @user = users(:users_1)
    sign_in @user
  end

  test "creating a Holocene event" do
    visit holocene_events_url
    click_on "New Holocene Event"

    #fill_in "Body", with: @holocene_event.body
    fill_in "End year", with: @holocene_event.end_year
    fill_in "End year mod", with: @holocene_event.end_year_mod
    fill_in "End year uncert", with: @holocene_event.end_year_uncert
    fill_in "Name", with: @holocene_event.name
    fill_in "Start year", with: @holocene_event.start_year
    fill_in "Start year mod", with: @holocene_event.start_year_mod
    fill_in "Start year uncert", with: @holocene_event.start_year_uncert
    fill_in_rich_text_area "holocene_event_body", with: "Test 1"
    #find('#holocene_event_event_type_id').find(:xpath, 'option[2]').select_option
    find('#holocene_event_region_id').find(:xpath, 'option[2]').select_option
    click_on "Create Holocene event"

    assert_text "Holocene event was successfully created"
    click_on "Back"
  end

  test "should not create a Holocene event" do
    visit holocene_events_url
    click_on "New Holocene Event"

    #fill_in "Body", with: @holocene_event.body
    fill_in "End year", with: @holocene_event.end_year
    fill_in "End year mod", with: @holocene_event.end_year_mod
    fill_in "End year uncert", with: @holocene_event.end_year_uncert
    fill_in "Name", with: ""
    fill_in "Start year", with: @holocene_event.start_year
    fill_in "Start year mod", with: @holocene_event.start_year_mod
    fill_in "Start year uncert", with: @holocene_event.start_year_uncert
    fill_in_rich_text_area "holocene_event_body", with: "Test 1"
    #find('#holocene_event_event_type_id').find(:xpath, 'option[2]').select_option
    find('#holocene_event_region_id').find(:xpath, 'option[2]').select_option
    click_on "Create Holocene event"

    assert_text "can't be blank"

    fill_in "Name", with: @holocene_event.name
    click_on "Create Holocene event"

    assert_text "Holocene event was successfully created"
    click_on "Back"
  end
end
