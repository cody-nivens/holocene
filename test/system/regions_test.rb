require "application_system_test_case"

class RegionsTest < ApplicationSystemTestCase
  setup do
    @region = regions(:Africa)
    @user = users(:users_1)
    sign_in @user
  end

  test "visiting the Region index" do
    visit regions_url
    assert_selector "h1", text: "Regions"
    assert_link "New Region"
    assert_no_text "link_to"
  end

  test "creating a Region" do
    visit regions_url
    click_on "New Region"

    fill_in "Name", with: @region.name
    fill_in_rich_text_area "region_body", with: "Test 1"

    click_on "Create Region"

    assert_text "Region was successfully created"
    click_on "Back"
  end

  test "should not create a Region" do
    visit regions_url
    click_on "New Region"

    fill_in "Name", with: ""
    fill_in_rich_text_area "region_body", with: "Test 1"

    click_on "Create Region"

    assert_text "can't be blank"

    fill_in "Name", with: @region.name
    click_on "Create Region"
    assert_text "Region was successfully created"
    click_on "Back"
  end

  test "updating a Region" do
    visit regions_url
    click_on "Edit", match: :first

    fill_in "Name", with: @region.name
    fill_in_rich_text_area "region_body", with: "Test 1"
    click_on "Update Region"

    assert_text "Region was successfully updated"
    click_on "Back"
  end

  test "should not update a Region" do
    visit regions_url
    click_on "Edit", match: :first

    fill_in "Name", with: ""
    fill_in_rich_text_area "region_body", with: "Test 1"
    click_on "Update Region"

    assert_text "can't be blank"

    fill_in "Name", with: @region.name
    click_on "Update Region"
    assert_text "Region was successfully updated"
    click_on "Back"
  end

  test "destroying a Region" do
    visit regions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Region was successfully destroyed"
  end
end
