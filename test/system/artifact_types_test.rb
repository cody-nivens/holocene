require "application_system_test_case"

class ArtifactTypesTest < ApplicationSystemTestCase
  setup do
    @artifact_type = artifact_types(:artifact_type_1)
    @book = books(:book_2)
    @user = users(:users_1)
    sign_in @user
  end

  test "visiting the Artifact type index" do
    visit book_artifact_types_url(@book)
    assert_selector "h1", text: "Artifact Types"
    assert_text "Ship"
  end

  test "creating a Artifact type" do
    visit book_artifact_types_url(@book)
    click_on "New Artifact Type"

    fill_in "Name", with: @artifact_type.name
    click_on "Create Artifact type"

    assert_text "Artifact type was successfully created"
    click_on "Back"
  end

  test "not creating a Artifact type" do
    visit book_artifact_types_url(@book)
    click_on "New Artifact Type"

    fill_in "Name", with: ""
    click_on "Create Artifact type"

    assert_text "Name can't be blank"
    click_on "Back"
  end

  test "updating a Artifact type" do
    visit book_artifact_types_url(@book)
    click_on "Edit", match: :first

    fill_in "Name", with: @artifact_type.name
    click_on "Update Artifact type"

    assert_text "Artifact type was successfully updated"
    click_on "Back"
  end

  test "not updating a Artifact type" do
    visit book_artifact_types_url(@book)
    click_on "Edit", match: :first

    fill_in "Name", with: ""
    click_on "Update Artifact type"

    assert_text "Name can't be blank"
    click_on "Back"
  end

  test "destroying a Artifact type" do
    visit book_artifact_types_url(@book)
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Artifact type was successfully destroyed"
  end
end
