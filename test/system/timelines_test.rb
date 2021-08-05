require "application_system_test_case"

class TimelinesTest < ApplicationSystemTestCase
  setup do
    @timeline = timelines(:timeline_1)
    @user = users(:users_1)
    sign_in @user
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
end
