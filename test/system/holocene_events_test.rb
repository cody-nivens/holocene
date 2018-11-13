require "application_system_test_case"

class HoloceneEventsTest < ApplicationSystemTestCase
  setup do
    @holocene_event = holocene_events(:one)
    @user = users(:one)
    sign_in @user
  end

  test "visiting the index" do
    visit holocene_events_url
    assert_selector "h1", text: "Holocene Events"
  end

  test "creating a Holocene event" do
    visit holocene_events_url
    click_on "New Holocene event"

    #fill_in "Body", with: @holocene_event.body
    fill_in "End year", with: @holocene_event.end_year
    fill_in "End year mod", with: @holocene_event.end_year_mod
    fill_in "End year uncert", with: @holocene_event.end_year_uncert
    fill_in "Name", with: @holocene_event.name
    fill_in "Start year", with: @holocene_event.start_year
    fill_in "Start year mod", with: @holocene_event.start_year_mod
    fill_in "Start year uncert", with: @holocene_event.start_year_uncert
    page.execute_script("var wysihtml5Editor = $('#holocene_event_body').data('wysihtml5').editor;wysihtml5Editor.setValue('Test for Holocene event.')")
    find('#holocene_event_event_type_id').find(:xpath, 'option[2]').select_option
    find('#holocene_event_region_id').find(:xpath, 'option[2]').select_option
    click_on "Create Holocene event"

    assert_text "Holocene event was successfully created"
    click_on "Back"
  end

  test "should not create a Holocene event" do
    visit holocene_events_url
    click_on "New Holocene event"

    #fill_in "Body", with: @holocene_event.body
    fill_in "End year", with: @holocene_event.end_year
    fill_in "End year mod", with: @holocene_event.end_year_mod
    fill_in "End year uncert", with: @holocene_event.end_year_uncert
    fill_in "Name", with: ""
    fill_in "Start year", with: @holocene_event.start_year
    fill_in "Start year mod", with: @holocene_event.start_year_mod
    fill_in "Start year uncert", with: @holocene_event.start_year_uncert
    page.execute_script("var wysihtml5Editor = $('#holocene_event_body').data('wysihtml5').editor;wysihtml5Editor.setValue('Test for Holocene event.')")
    find('#holocene_event_event_type_id').find(:xpath, 'option[2]').select_option
    find('#holocene_event_region_id').find(:xpath, 'option[2]').select_option
    click_on "Create Holocene event"

    assert_text "error prohibited this holocene_event from being saved"
    assert_text "Name can't be blank"

    fill_in "Name", with: @holocene_event.name
    click_on "Create Holocene event"
    assert_text "Holocene event was successfully created"
    click_on "Back"
  end

  test "updating a Holocene event" do
    visit holocene_events_url
    click_on "Edit", match: :first

    #fill_in "Body", with: @holocene_event.body
    fill_in "End year", with: @holocene_event.end_year
    fill_in "End year mod", with: @holocene_event.end_year_mod
    fill_in "End year uncert", with: @holocene_event.end_year_uncert
    fill_in "Name", with: @holocene_event.name
    fill_in "Start year", with: @holocene_event.start_year
    fill_in "Start year mod", with: @holocene_event.start_year_mod
    fill_in "Start year uncert", with: @holocene_event.start_year_uncert
    page.execute_script("var wysihtml5Editor = $('#holocene_event_body').data('wysihtml5').editor;wysihtml5Editor.setValue('Test for Holocene event.')")
    find('#holocene_event_event_type_id').find(:xpath, 'option[2]').select_option
    find('#holocene_event_region_id').find(:xpath, 'option[2]').select_option
    click_on "Update Holocene event"

    assert_text "Holocene event was successfully updated"
    click_on "Back"
  end

  test "should not update a Holocene event" do
    visit holocene_events_url
    click_on "Edit", match: :first

    #fill_in "Body", with: @holocene_event.body
    fill_in "End year", with: @holocene_event.end_year
    fill_in "End year mod", with: @holocene_event.end_year_mod
    fill_in "End year uncert", with: @holocene_event.end_year_uncert
    fill_in "Name", with: ""
    fill_in "Start year", with: @holocene_event.start_year
    fill_in "Start year mod", with: @holocene_event.start_year_mod
    fill_in "Start year uncert", with: @holocene_event.start_year_uncert
    page.execute_script("var wysihtml5Editor = $('#holocene_event_body').data('wysihtml5').editor;wysihtml5Editor.setValue('Test for Holocene event.')")
    find('#holocene_event_event_type_id').find(:xpath, 'option[2]').select_option
    find('#holocene_event_region_id').find(:xpath, 'option[2]').select_option
    click_on "Update Holocene event"

    assert_text "error prohibited this holocene_event from being saved"
    assert_text "Name can't be blank"

    fill_in "Name", with: @holocene_event.name
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
