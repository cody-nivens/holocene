require "application_system_test_case"

class ActorLocationTimesTest < ApplicationSystemTestCase
  setup do
    @actor_location_time = actor_location_times(:one)
  end

  test "visiting the index" do
    visit actor_location_times_url
    assert_selector "h1", text: "Actor Location Times"
  end

  test "creating a Actor location time" do
    visit actor_location_times_url
    click_on "New Actor Location Time"

    fill_in "Actor", with: @actor_location_time.actor_id
    fill_in "Location time", with: @actor_location_time.location_time_id
    click_on "Create Actor location time"

    assert_text "Actor location time was successfully created"
    click_on "Back"
  end

  test "updating a Actor location time" do
    visit actor_location_times_url
    click_on "Edit", match: :first

    fill_in "Actor", with: @actor_location_time.actor_id
    fill_in "Location time", with: @actor_location_time.location_time_id
    click_on "Update Actor location time"

    assert_text "Actor location time was successfully updated"
    click_on "Back"
  end

  test "destroying a Actor location time" do
    visit actor_location_times_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Actor location time was successfully destroyed"
  end
end
