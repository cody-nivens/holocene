require "application_system_test_case"

class ArtifactTypesTest < ApplicationSystemTestCase
  setup do
    @artifact_type = artifact_types(:one)
  end

  test "visiting the index" do
    visit artifact_types_url
    assert_selector "h1", text: "Artifact Types"
  end

  test "creating a Artifact type" do
    visit artifact_types_url
    click_on "New Artifact Type"

    fill_in "Book", with: @artifact_type.book_id
    fill_in "Name", with: @artifact_type.name
    click_on "Create Artifact type"

    assert_text "Artifact type was successfully created"
    click_on "Back"
  end

  test "updating a Artifact type" do
    visit artifact_types_url
    click_on "Edit", match: :first

    fill_in "Book", with: @artifact_type.book_id
    fill_in "Name", with: @artifact_type.name
    click_on "Update Artifact type"

    assert_text "Artifact type was successfully updated"
    click_on "Back"
  end

  test "destroying a Artifact type" do
    visit artifact_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Artifact type was successfully destroyed"
  end
end
