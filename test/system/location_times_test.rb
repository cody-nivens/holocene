require "application_system_test_case"

class LocationTimesTest < ApplicationSystemTestCase
  setup do
    @location_time = location_times(:location_time_1)
    @user = users(:users_1)
    sign_in @user
  end

  if 1 == 0
  test "visiting the index" do
    visit location_times_url
    assert_selector "h1", text: "Location Times"
  end

  test "creating a Location time" do
    visit location_times_url
    click_on "New Location Time"

    fill_in "Loc time", with: @location_time.loc_time
    fill_in "Location", with: @location_time.location_id
    click_on "Create Location time"

    assert_text "Location time was successfully created"
    click_on "Back"
  end

  test "updating a Location time" do
    visit location_times_url
    click_on "Edit", match: :first

    fill_in "Loc time", with: @location_time.loc_time
    fill_in "Location", with: @location_time.location_id
    click_on "Update Location time"

    assert_text "Location time was successfully updated"
    click_on "Back"
  end

  test "destroying a Location time" do
    visit location_times_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Location time was successfully destroyed"
  end
end
end
