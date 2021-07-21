require "application_system_test_case"

class ArtifactsTest < ApplicationSystemTestCase
  setup do
    @artifact = artifacts(:artifact_1)
    @book = books(:book_2)
    @user = users(:users_1)
    sign_in @user
  end

  test "visiting the Artifacts index" do
    visit book_artifacts_url(@book)
    assert_selector "h1", text: "Artifacts"
  end

  test "creating a Artifact" do
    visit book_artifacts_url(@book)
    click_on "New Artifact"

    select "John", from: 'artifact_character_id'
    fill_in "Name", with: @artifact.name
    select "Ship", from: 'artifact_artifact_type_id'
    click_on "Create Artifact"

    assert_text "Artifact was successfully created"
    click_on "Back"
  end

  test "not creating a Artifact" do
    visit book_artifacts_url(@book)
    click_on "New Artifact"

    select "John", from: 'artifact_character_id'
    fill_in "Name", with: ""
    select "Ship", from: 'artifact_artifact_type_id'
    click_on "Create Artifact"

    assert_text "Name can't be blank"
    click_on "Back"
  end

  test "updating a Artifact" do
    visit book_artifacts_url(@book)
    click_on "Edit", match: :first

    select "John", from: 'artifact_character_id'
    fill_in "Name", with: @artifact.name
    select "Ship", from: 'artifact_artifact_type_id'
    click_on "Update Artifact"

    assert_text "Artifact was successfully updated"
    click_on "Back"
  end

  test "not updating a Artifact" do
    visit book_artifacts_url(@book)
    click_on "Edit", match: :first

    select "John", from: 'artifact_character_id'
    fill_in "Name", with: ""
    select "Ship", from: 'artifact_artifact_type_id'
    click_on "Update Artifact"

    assert_text "Name can't be blank"
    click_on "Back"
  end

  test "destroying a Artifact" do
    visit book_artifacts_url(@book)
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Artifact was successfully destroyed"
  end
end
