require "application_system_test_case"

class ArtifactLocationsTest < ApplicationSystemTestCase
  setup do
    @artifact_location = artifact_locations(:one)
  end

  test "visiting the index" do
    visit artifact_locations_url
    assert_selector "h1", text: "Artifact Locations"
  end

  test "creating a Artifact location" do
    visit artifact_locations_url
    click_on "New Artifact Location"

    fill_in "Artifact", with: @artifact_location.artifact_id
    fill_in "Located", with: @artifact_location.located_id
    fill_in "Located type", with: @artifact_location.located_type
    click_on "Create Artifact location"

    assert_text "Artifact location was successfully created"
    click_on "Back"
  end

  test "updating a Artifact location" do
    visit artifact_locations_url
    click_on "Edit", match: :first

    fill_in "Artifact", with: @artifact_location.artifact_id
    fill_in "Located", with: @artifact_location.located_id
    fill_in "Located type", with: @artifact_location.located_type
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
