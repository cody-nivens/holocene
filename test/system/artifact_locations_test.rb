require "application_system_test_case"

class ArtifactLocationsTest < ApplicationSystemTestCase
  setup do
    @artifact_location = artifact_locations(:artifact_location_1)
    @user = users(:users_1)
    sign_in @user
  end

  test "visiting the Artifact location index" do
    visit artifact_locations_url
    assert_selector "h1", text: "Artifact Locations"
  end

  test "creating a Artifact location" do
    visit artifact_locations_url
    click_on "New Artifact Location"

    select "MyString_1", from: 'artifact_location_artifact_id'
    click_on "Create Artifact location"

    assert_text "Artifact location was successfully created"
    click_on "Back"
  end

  test "updating a Artifact location" do
    visit artifact_locations_url
    click_on "Edit", match: :first

    select "MyString_1", from: 'artifact_location_artifact_id'
    click_on "Update Artifact location"

    assert_text "Artifact location was successfully updated"
    click_on "Back"
  end

  test "destroying a Artifact location" do
    visit artifact_locations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Artifact location was successfully destroyed"
  end
end
