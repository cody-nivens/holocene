require "application_system_test_case"

class HoloceneEventsTest < ApplicationSystemTestCase
  setup do
    @holocene_event = holocene_events(:one)
  end

  test "visiting the index" do
    visit holocene_events_url
    assert_selector "h1", text: "Holocene Events"
  end

  test "creating a Holocene event" do
    visit holocene_events_url
    click_on "New Holocene event"

    #fill_in "Body", with: @holocene_event.body
    page.execute_script("var editor=$('.wysihtml5-editor').data('wysihtml5').editor")
    page.execute_script("editor.setValue('#{@holocene_event.body}')")
    fill_in "End year", with: @holocene_event.end_year
    fill_in "End year mod", with: @holocene_event.end_year_mod
    fill_in "End year uncert", with: @holocene_event.end_year_uncert
    fill_in "Event type", with: @holocene_event.event_type
    fill_in "Name", with: @holocene_event.name
    fill_in "Region", with: @holocene_event.region
    fill_in "Start year", with: @holocene_event.start_year
    fill_in "Start year mod", with: @holocene_event.start_year_mod
    fill_in "Start year uncert", with: @holocene_event.start_year_uncert
    click_on "Create Holocene event"

    assert_text "Holocene event was successfully created"
    click_on "Back"
  end

  test "updating a Holocene event" do
    visit holocene_events_url
    click_on "Edit", match: :first

    #fill_in "Body", with: @holocene_event.body
    page.execute_script("var editor=$('.wysihtml5-editor').data('wysihtml5').editor;")
    page.execute_script("editor.setValue('#{@holocene_event.body}')")
    fill_in "End year", with: @holocene_event.end_year
    fill_in "End year mod", with: @holocene_event.end_year_mod
    fill_in "End year uncert", with: @holocene_event.end_year_uncert
    fill_in "Event Type", with: @holocene_event.event_type
    fill_in "Name", with: @holocene_event.name
    fill_in "Region", with: @holocene_event.region
    fill_in "Start year", with: @holocene_event.start_year
    fill_in "Start year mod", with: @holocene_event.start_year_mod
    fill_in "Start year uncert", with: @holocene_event.start_year_uncert
    click_on "Update Holocene event"

    assert_text "Holocene event was successfully updated"
    click_on "Back"
  end

  test "destroying a Holocene event" do
    visit holocene_events_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Holocene event was successfully destroyed"
  end
end
