require "application_system_test_case"

class ActsTest < ApplicationSystemTestCase
  setup do
    @act = acts(:one)
  end

  test "visiting the index" do
    visit acts_url
    assert_selector "h1", text: "Acts"
  end

  test "creating a Act" do
    visit acts_url
    click_on "New Act"

    fill_in "Book", with: @act.book_id
    fill_in "Name", with: @act.name
    click_on "Create Act"

    assert_text "Act was successfully created"
    click_on "Back"
  end

  test "updating a Act" do
    visit acts_url
    click_on "Edit", match: :first

    fill_in "Book", with: @act.book_id
    fill_in "Name", with: @act.name
    click_on "Update Act"

    assert_text "Act was successfully updated"
    click_on "Back"
  end

  test "destroying a Act" do
    visit acts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Act was successfully destroyed"
  end
end
