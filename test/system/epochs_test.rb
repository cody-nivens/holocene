require "application_system_test_case"

class EpochsTest < ApplicationSystemTestCase
  setup do
    @epoch = epochs(:epoch_1)
    @user = users(:users_1)
    sign_in @user
  end

  test "visiting the Epoch index" do
    visit epochs_url
    assert_selector "h1", text: "Epochs"
    assert_link "New Epoch"
    assert_no_text "link_to"
    click_on "Show", match: :first
    assert_text "Dog buried inside"
    assert_link "Timeline"
    click_on "Timeline"
    assert_link "Display"
    click_on "Back"
  end

  test "visiting the map" do
    visit epochs_url
    assert_selector "h1", text: "Epochs"
    assert_link "New Epoch"
    assert_no_text "link_to"
    click_on "Show", match: :first
    assert_text "Dog buried inside"
    assert_link "Map"
    click_on "Map"
    assert_link "Back"
    click_on "Back"
  end

  test "creating a Epoch" do
    visit epochs_url
    click_on "New Epoch"

    fill_in "End date", with: @epoch.end_date
    fill_in "Name", with: @epoch.name
    fill_in "Start date", with: @epoch.start_date
    click_on "Create Epoch"

    assert_text "Epoch was successfully created"
    click_on "Back"
  end

  test "should not create a Epoch" do
    visit epochs_url
    click_on "New Epoch"

    fill_in "End date", with: @epoch.end_date
    fill_in "Name", with: ""
    fill_in "Start date", with: @epoch.start_date
    click_on "Create Epoch"

    assert_text "can't be blank"

    fill_in "Name", with: @epoch.name
    click_on "Create Epoch"
    assert_text "Epoch was successfully created"
    click_on "Back"
  end
end
