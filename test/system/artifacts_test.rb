require "application_system_test_case"

class ArtifactsTest < ApplicationSystemTestCase
  setup do
    @artifact = artifacts(:artifact_1)
    @book = books(:book_2)
    @user = users(:users_1)
    sign_in @user
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

    assert_text "Name\ncan't be blank"
    click_on "Back"
  end
end
