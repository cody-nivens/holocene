require "application_system_test_case"

class FootnotesTest < ApplicationSystemTestCase
  setup do
    @footnote = footnotes(:one)
  end

  test "visiting the index" do
    visit footnotes_url
    assert_selector "h1", text: "Footnotes"
  end

  test "creating a Footnote" do
    visit footnotes_url
    click_on "New Footnote"

    click_on "Create Footnote"

    assert_text "Footnote was successfully created"
    click_on "Back"
  end

  test "updating a Footnote" do
    visit footnotes_url
    click_on "Edit", match: :first

    click_on "Update Footnote"

    assert_text "Footnote was successfully updated"
    click_on "Back"
  end

  test "destroying a Footnote" do
    visit footnotes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Footnote was successfully destroyed"
  end
end
