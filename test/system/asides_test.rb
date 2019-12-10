require "application_system_test_case"

class AsidesTest < ApplicationSystemTestCase
  setup do
    @aside = asides(:one)
  end

  test "visiting the index" do
    visit asides_url
    assert_selector "h1", text: "Asides"
  end

  test "creating a Aside" do
    visit asides_url
    click_on "New Aside"

    fill_in "Body", with: @aside.body
    fill_in "Name", with: @aside.name
    click_on "Create Aside"

    assert_text "Aside was successfully created"
    click_on "Back"
  end

  test "updating a Aside" do
    visit asides_url
    click_on "Edit", match: :first

    fill_in "Body", with: @aside.body
    fill_in "Name", with: @aside.name
    click_on "Update Aside"

    assert_text "Aside was successfully updated"
    click_on "Back"
  end

  test "destroying a Aside" do
    visit asides_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Aside was successfully destroyed"
  end
end
