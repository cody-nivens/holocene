require "application_system_test_case"

class TimelinesTest < ApplicationSystemTestCase
  setup do
    @timeline = timelines(:timeline_1)
    @user = users(:users_1)
    sign_in @user
  end

  test "visiting the Timeline index" do
    visit timelines_url
    assert_selector "h1", text: "Timelines"
    assert_link "New Timeline"
    assert_no_text "link_to"
    click_on "Show", match: :first

    assert_text "Name"
    click_on "Display"

    assert_text "Name"
  end

  test "visiting the map" do
    visit timelines_url
    assert_selector "h1", text: "Timelines"
    assert_link "New Timeline"
    assert_no_text "link_to"
    click_on "Show", match: :first
    assert_link "Map"
    click_on "Map"
    assert_link "Back"
    click_on "Back"
  end

  test "visiting the timeline" do
      visit timeline_timeline_url(:timeline_id => @timeline.id)
    assert_text "Dog buried"
    assert_link "Display"
    assert_link "Back"
  end


  test "visiting display" do
    visit timeline_url(@timeline)

    assert_text "Main"
    assert_link  "Display"
    click_on "Display"

    assert_button "Delete Events"
    assert_text "Domestication of Horses"

    he = HoloceneEvent.find_by_name("Domestication of Horses")
    find(:xpath,"//input[@type='checkbox' and @value=#{he.id}]").set(true)
    click_on "Delete Events"
   
    assert_text "Timeline was successfully updated"
    assert_no_text "Domestication of Horses"

    assert_link  "Display"
    click_on "Display"
    assert_button "Delete Events"
    click_on "Add Event"

    assert_text "Domestication of Horses"
    find(:xpath,"//input[@type='checkbox' and @value=#{he.id}]").set(true)
    click_on "Add Events"
   
    assert_text "Timeline was successfully updated"
    assert_text "Domestication of Horses"

  end

  test "creating a Timeline" do
    visit timelines_url
    click_on "New Timeline"

    fill_in "Description", with: @timeline.description
    fill_in "Name", with: @timeline.name
    click_on "Create Timeline"

    assert_text "Timeline was successfully created"
    click_on "Back"
  end

  test "should not create a Timeline" do
    visit timelines_url
    click_on "New Timeline"

    fill_in "Description", with: @timeline.description
    fill_in "Name", with: ""
    click_on "Create Timeline"

    assert_text "can't be blank"

    fill_in "Name", with: @timeline.name
    click_on "Create Timeline"
    assert_text "Timeline was successfully created"
    click_on "Back"
  end

  test "updating a Timeline" do
    visit timelines_url
    click_on "Edit", match: :first

    fill_in "Description", with: @timeline.description
    fill_in "Name", with: @timeline.name
    click_on "Update Timeline"

    assert_text "Timeline was successfully updated"
    click_on "Back"
  end

  test "should not update a Timeline" do
    visit timelines_url
    click_on "Edit", match: :first

    fill_in "Description", with: @timeline.description
    fill_in "Name", with: ""
    click_on "Update Timeline"

    assert_text "can't be blank"

    fill_in "Name", with: @timeline.name
    click_on "Update Timeline"
    assert_text "Timeline was successfully updated"
    click_on "Back"
  end

  test "destroying a Timeline" do
    visit timelines_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Timeline was successfully destroyed"
  end
end
