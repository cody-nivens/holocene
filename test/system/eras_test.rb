require "application_system_test_case"

class ErasTest < ApplicationSystemTestCase
  setup do
    @era = eras(:one)
  end

  test "visiting the index" do
    visit eras_url
    assert_selector "h1", text: "Eras"
  end

  test "creating a Era" do
    visit eras_url
    click_on "New Era"

    fill_in "End date", with: @era.end_date
    fill_in "Name", with: @era.name
    fill_in "Start date", with: @era.start_date
    click_on "Create Era"

    assert_text "Era was successfully created"
    click_on "Back"
  end

  test "updating a Era" do
    visit eras_url
    click_on "Edit", match: :first

    fill_in "End date", with: @era.end_date
    fill_in "Name", with: @era.name
    fill_in "Start date", with: @era.start_date
    click_on "Update Era"

    assert_text "Era was successfully updated"
    click_on "Back"
  end

  test "destroying a Era" do
    visit eras_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Era was successfully destroyed"
  end
end
