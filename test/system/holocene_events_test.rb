require "application_system_test_case"

class HoloceneEventsTest < ApplicationSystemTestCase
  setup do
    @holocene_event = holocene_events(:holocene_event_1)
    file = Rails.root.join('test', 'fixtures', 'files', 'image.jpg')
    @holocene_event.image.attach(io: File.open(file), filename: 'image.jpg')
    @user = users(:users_1)
    sign_in @user
  end

  test "visiting the Holocene event index" do
    visit holocene_events_url

    assert_selector "h2", text: "Holocene Events"
    assert_link "New Holocene Event"
    assert_no_text "link_to"
  end

  test "visiting the Holocene event index 2" do
    visit holocene_events_url

    assert_selector "h2", text: "Holocene Events"
    assert_link "New Holocene Event"
    assert_no_text "link_to"

    fill_in "Name LIKE", with: @holocene_event.name
    click_on "Search"
  end

  test "should get Holocene event index 3" do
    visit holocene_events_url params:{ holocene_events_grid: { name: "Dog" } }

    assert_link "New Holocene Event"
  end

  test "should get Holocene event index 4" do
    visit holocene_events_url params:{ holocene_events_grid: { event_type: EventType.first } }

    assert_link "New Holocene Event"
  end

  test "visiting the map" do
    visit holocene_events_url

    assert_link "New Holocene Event"
    find(:xpath, "//a[text()='Dog buried inside of human dwellings ']").click


    assert_link "Map"
    click_on "Map"

    assert_link "Back"
    click_on "Back"
  end

  test "should get tagged 1" do
    visit tag_url(:tag => 'Domestication')
    assert_text "Domestication of Horse"
  end

  test "should get tagged 2" do
    visit tag_url
    assert_text "Dog buried inside"
  end

#  test "should return json index" do
#    get '/holocene_events.json'
#    body = JSON.parse(page.source)
#    assert_equal "", body[0]["body"]
#    assert_response :success
#  end

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
    fill_in_rich_text_area "holocene_event_body", with: "Test 1"
    #find('#holocene_event_event_type_id').find(:xpath, 'option[2]').select_option
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
    fill_in_rich_text_area "holocene_event_body", with: "Test 1"
    #find('#holocene_event_event_type_id').find(:xpath, 'option[2]').select_option
    find('#holocene_event_region_id').find(:xpath, 'option[2]').select_option
    click_on "Update Holocene event"

    assert_text "can't be blank"

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
